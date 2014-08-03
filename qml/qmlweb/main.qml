import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Todo list")
    width: 1024
    height: 768

    BrowserState {
        id: state
        stack: stackView
    }

    toolBar: RowLayout {
        width: parent.width

        ToolBar {
            ToolButton { iconSource: "qrc:///icons/images/arrow-left.png"; onClicked: state.goBack() }
        }

        TextField { id: urlBar; Layout.fillWidth: true; text: state.url }

        ToolBar {
            ToolButton { iconSource: "qrc:///icons/images/arrow-right.png"; onClicked: state.url = urlBar.text }
        }
    }

    StackView {
        id: stackView

        anchors.fill: parent
        clip: true
    }

    Component.onCompleted: state.url = "http://flickr.shaan7.info/index.qml"
}
