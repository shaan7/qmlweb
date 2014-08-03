import QtQuick 2.0
import "ComponentCreation.js" as ComponentCreation

Item {
    property string url

    visible: false
    onUrlChanged: ComponentCreation.navigate(url)

    function goBack() {
        ComponentCreation.goBack();
    }
}
