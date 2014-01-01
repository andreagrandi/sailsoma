import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0
import "pages"

ApplicationWindow
{
    id: sailSomaWindow
    ChannelsModel { id: channelsModel }
    initialPage: Component { SailSoma { model: channelsModel } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}


