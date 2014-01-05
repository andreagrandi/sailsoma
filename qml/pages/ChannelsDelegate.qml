import QtQuick 2.0
import Sailfish.Silica 1.0

Component
{
    id: channelDelegate

    Item
    {
        width: parent.width
        height: Theme.itemSizeExtraLarge
        id: channels

        Image
        {
            id: thumb
            source: channelImage
            sourceSize.height: Theme.itemSizeExtraLarge - Theme.paddingSmall
            sourceSize.width: Theme.itemSizeExtraLarge - Theme.paddingSmall
            asynchronous: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingSmall
            width: Theme.itemSizeExtraLarge - Theme.paddingSmall
            height: Theme.itemSizeExtraLarge - Theme.paddingSmall
        }

        Column
        {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingMedium
            anchors.left: thumb.right
            anchors.leftMargin: Theme.paddingMedium

            Label
            {
                id: channelNameLabel
                text: channelName;
                font.pixelSize: Theme.fontSizeMedium
                font.weight: Font.Bold;
                anchors.left: parent.left
                anchors.right: parent.right
                color: Theme.primaryColor
            }

            Label
            {
                id: channelDescriptionLabel
                text: channelDescription;
                width: parent.width
                font.pixelSize: Theme.fontSizeTiny
                font.weight: Font.Light;
                maximumLineCount: 2
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.left: parent.left
                anchors.right: parent.right
            }

            Label
            {
                id: channelSongLabel
                text: song;
                font.pixelSize: Theme.fontSizeSmall
                font.weight: Font.Bold;
                maximumLineCount: 1
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.left: parent.left
                anchors.right: parent.right
            }
        }


        MouseArea
        {
            id: mouseArea
            anchors.fill: parent

            onClicked:
            {
                console.debug(channelName + " clicked");
                console.debug(songUrlFast);

                if (page.currentChannel != channelName)
                {
                    serverComm.loadChannel(songUrlFast);
                    serverComm.updateChannelInfo(model.channelId);
                    coverTitleUpdate(channelName)
                    coverImageUpdate(channelImage)
                }

                page.currentChannel = channelName;
                channelPlayer.model = model
                pageStack.push(channelPlayer)
            }
        }
    }
}
