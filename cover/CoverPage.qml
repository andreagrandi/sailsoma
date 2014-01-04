import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

CoverBackground
{
    property QtObject model;
    property alias text: coverPlaceholderId.text;

    CoverPlaceholder
    {
        id: coverPlaceholderId
        text: coverTitle
        icon.source: coverImage
        icon.width: 120
        icon.height: 120
    }
}
