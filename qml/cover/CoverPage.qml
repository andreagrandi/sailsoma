import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground
{
    property QtObject model;
    property alias text: coverPlaceholderId.text;

    CoverPlaceholder
    {
        id: coverPlaceholderId
        text: coverTitle
        icon.source: coverImage
        icon.width: Theme.iconSizeLarge * 1.2
        icon.height: Theme.iconSizeLarge * 1.2
    }
}
