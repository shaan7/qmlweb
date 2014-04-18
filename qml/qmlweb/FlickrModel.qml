import QtQuick 2.0
import QtQuick.XmlListModel 2.0

XmlListModel {
    property variant coordinate

    source: "http://api.flickr.com/services/rest/?" +
            "method=flickr.photos.getRecent&" +
            "per_page=30&" +
            "sort=date-taken-desc&" +
            "api_key=e36784df8a03fea04c22ed93318b291c";
    query: "/rsp/photos/photo"

    XmlRole { name: "title"; query: "@title/string()" }
    XmlRole { name: "datetaken"; query: "@datetaken/string()" }
    XmlRole { name: "farm"; query: "@farm/string()" }
    XmlRole { name: "server"; query: "@server/string()" }
    XmlRole { name: "id"; query: "@id/string()" }
    XmlRole { name: "secret"; query: "@secret/string()" }
}
