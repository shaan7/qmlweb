import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1
import QtQuick.XmlListModel 2.0

Item {
    ColumnLayout {
        anchors { fill: parent; margins: 10 }

        TextField {
            Layout.fillWidth: true
            placeholderText: "What needs to be done?"
            onAccepted: {
                todoModel.append({ "display": text, "done": false});
                text = "";
            }
        }

        ListView {
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: ListModel {
                id: todoModel
            }
            delegate: RowLayout {
                width: parent.width

                CheckBox { onCheckedChanged: todoModel.get(index).done = checked }
                Label { Layout.fillWidth: true; text: display; font.strikeout: done; wrapMode: Text.WordWrap; }
                ToolButton { text: 'X'; onClicked: todoModel.remove(index) }
            }
        }
    }
}
