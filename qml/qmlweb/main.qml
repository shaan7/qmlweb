import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Todo list")
    width: 320
    height: 480

    BrowserState {
        id: state
        stack: stackView

        url: "https://raw.githubusercontent.com/shaan7/qmlweb/master/data/Todo.qml"
    }

    toolBar: RowLayout {
        width: parent.width

        ToolBar {
            ToolButton { iconSource: "qrc:///icons/images/arrow-left.png"; onClicked: stackView.pop() }
        }

        TextField { id: urlBar; Layout.fillWidth: true; text: state.url }

        ToolBar {
            ToolButton { iconSource: "qrc:///icons/images/arrow-right.png"; onClicked: state.url = urlBar.text }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
    }
}
