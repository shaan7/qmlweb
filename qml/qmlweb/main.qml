import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Todo list")
    width: 1024
    height: 768

    Browser {
        id: browser
    }

    toolBar: RowLayout {
        width: parent.width

        ToolBar {
            ToolButton { iconSource: "qrc:///icons/images/arrow-left.png"; onClicked: browser.goBack() }
        }

        TextField { id: urlBar; Layout.fillWidth: true; text: browser.url }

        ToolBar {
            ToolButton { iconSource: "qrc:///icons/images/arrow-right.png"; onClicked: browser.url = urlBar.text }
        }
    }

    StackView {
        id: stack

        anchors.fill: parent
        clip: true
    }

    Component.onCompleted: browser.url = "http://flickr.shaan7.info/index.qml"
}
