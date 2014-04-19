import QtQuick 2.1
import QtQuick.Controls 1.0
import "ComponentCreation.js" as ComponentCreation

ApplicationWindow {
    title: qsTr("Todo list")
    width: 320
    height: 480

    StackView {
        id: stackView
        anchors.fill: parent
    }

    Component.onCompleted: ComponentCreation.navigate("http://www.shantanutushar.com/qml/Todo.qml")
}
