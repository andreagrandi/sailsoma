import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0
import "pages"
import "cover"

ApplicationWindow
{
    id: sailSomaWindow

    property string coverTitle: "SailSoma"
    property url coverImage: "cover/sailsoma.png"

    ChannelsModel { id: channelsModel }

    cover: Component { CoverPage { id: sailSomaCover } }

    initialPage: Component {
        SailSoma {
            model: channelsModel

            onCoverTitleUpdate: {
                sailSomaWindow.coverTitle = value
            }

            onCoverImageUpdate: {
                sailSomaWindow.coverImage = value
            }
        }
    }
}
