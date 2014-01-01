import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0
import "pages"
import "cover"

ApplicationWindow
{
    id: sailSomaWindow
    ChannelsModel { id: channelsModel }
    initialPage: Component { SailSoma { model: channelsModel } }
    cover: Component { CoverPage { model: channelsModel } }
}
