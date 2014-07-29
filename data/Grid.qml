import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.XmlListModel 2.0

GridView {
    id: theGrid

    signal clicked(string url)

    anchors { fill: parent; margins: 10 }

    header: Label { text: theGrid.count + " items" }
    delegate: Image {
        property string url_without_size: "http://farm" + farm + ".static.flickr.com/" + server + "/" + id + "_" + secret
        source: url_without_size + (GridView.isCurrentItem ? "_m.jpg" : "_s.jpg")
        scale: GridView.isCurrentItem && status == Image.Ready ?  1.2 : 1
        opacity: GridView.isCurrentItem ? 1 : 0.4
        z: GridView.isCurrentItem ? 1 : 0

        MouseArea {
            anchors.fill: parent
            onClicked: theGrid.currentIndex = index
        }

        Behavior on scale {
                NumberAnimation { duration: 100 }
        }
        Behavior on opacity {
                NumberAnimation { duration: 100 }
        }
    }

    model: XmlListModel {
        source: "https://api.flickr.com/services/rest/?" +
                "method=flickr.photos.getRecent&" +
                "per_page=30&" +
                "sort=date-taken-desc&" +
                "api_key=e36784df8a03fea04c22ed93318b291c"
        query: "/rsp/photos/photo"

        XmlRole { name: "title"; query: "@title/string()" }
        XmlRole { name: "datetaken"; query: "@datetaken/string()" }
        XmlRole { name: "farm"; query: "@farm/string()" }
        XmlRole { name: "server"; query: "@server/string()" }
        XmlRole { name: "id"; query: "@id/string()" }
        XmlRole { name: "secret"; query: "@secret/string()" }
    }
}
