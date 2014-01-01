import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

CoverBackground
{
    id: coverBackgroundId;
    property XmlListModel model;

    CoverPlaceholder
    {
        id: coverPlaceholderId
        //text: coverBackgroundId.model.channelName
        //icon.source: coverBackgroundId.model.channelImage
        text: "SailSoma"
        icon.source: "sailsoma.png"
        icon.width: 120
        icon.height: 120
    }
}
