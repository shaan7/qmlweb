import QtQuick 2.1
import QtQuick.Controls 1.0
import "ComponentCreation.js" as ComponentCreation

ApplicationWindow {
    title: qsTr("Todo list")
    width: 320
    height: 480

    toolBar: ToolBar {
        ToolButton { iconSource: "qrc:///icons/arrow-left.png"; onClicked: stackView.pop() }
    }

    StackView {
        id: stackView
        anchors.fill: parent
    }

    Component.onCompleted: ComponentCreation.navigate("https://raw.githubusercontent.com/shaan7/qmlweb/master/data/Todo.qml")
}
