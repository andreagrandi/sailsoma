import QtQuick 2.0
import Sailfish.Silica 1.0

Component
{
    id: channelDelegate

    Item
    {
        width: parent.width
        height: 130
        id: channels

        Image
        {
            id: thumb
            source: channelImage
            sourceSize.height: 120
            sourceSize.width: 120
            asynchronous: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 0
            width: 120
            height: 120
        }

        Column
        {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.rightMargin: 10
            anchors.left: thumb.right
            anchors.leftMargin: 20
            spacing: 4

            Label
            {
                id: channelNameLabel
                text: channelName;
                font.pixelSize: 28;
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
                font.pixelSize: 20;
                font.weight: Font.Light;
                maximumLineCount: 2
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.top: channelNameLabel.bottom
                anchors.left: parent.left
                anchors.right: parent.right
            }

            Label
            {
                id: channelSongLabel
                text: song;
                font.pixelSize: 24;
                font.weight: Font.Bold;
                maximumLineCount: 1
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors.top: channelDescriptionLabel.bottom
                anchors.left: parent.left
                anchors.right: parent.right
            }
        }

//        Rectangle
//        {
//            anchors.bottom: parent.bottom
//            height: 1
//            color: "#e4e5e7"
//            anchors.left: parent.left
//            anchors.right: parent.right
//        }

//                MouseArea
//                {
//                    id: mouseArea
//                    anchors.fill: parent

//                    onClicked:
//                    {
//                        console.debug(channelName + " clicked");
//                        console.debug(songUrlFast);

//                        if (mainPage.currentChannel != channelName)
//                        {
//                            serverComm.loadChannel(songUrlFast)
//                        }

//                        mainPage.currentChannel = channelName;
//                        channelPlayer.model = model
//                        pageStack.push(channelPlayer)
//                    }
//                }
    }
}
