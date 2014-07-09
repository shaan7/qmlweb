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
	source: url_without_size + "_s.jpg"

	MouseArea {
		anchors.fill: parent
		onClicked: theGrid.clicked(parent.url_without_size)
	}
    }
}
