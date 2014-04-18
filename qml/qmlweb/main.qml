import QtQuick 2.1
import QtQuick.Controls 1.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 320
    height: 480

    FlickrModel {
        id: flickrModel
    }

    Loader {
        anchors.fill: parent
        source: "http://www.shantanutushar.com/Grid.qml"

        Loader {
            id: imageViewer
            property string url
            anchors { fill: parent; margins: 20 }
            z: 1

            onLoaded: item.source = imageViewer.url
        }

        onLoaded: {
            item.model = flickrModel;
            item.clicked.connect(loadImage);
        }

        function loadImage(url)
        {
            imageViewer.url = url + '_m.jpg';
            imageViewer.source = "http://www.shantanutushar.com/ImageView.qml";
        }
    }
}
