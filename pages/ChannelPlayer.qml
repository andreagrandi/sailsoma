import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    id: channelPlayer
    property QtObject model: null
    property bool playing : false

    PageHeader
    {
        id: pgHead
        title: model ? model.channelName : ""
    }

    BusyIndicator
    {
        id: indicator
        running: true
        visible: true
        anchors.centerIn: parent
    }

    Connections
    {
        target: serverComm

        onChannelLoading:
        {
            indicator.visible = true;
            indicator.running = true;
        }

        onChannelLoaded:
        {
            indicator.visible = false;
            indicator.running = false;
        }

        onPositionUpdate:
        {
            counterLabelP.text = minutes + ":" + seconds;
        }

        onUpdateSong:
        {
            if (model) {
                serverComm.updateChannelInfo(model.channelId);
            }
        }

        onChannelSongUpdate:
        {
            songLabelP.text = song;
        }

        onSongPlaying:
        {
            playing = true
        }

        onSongPaused:
        {
            playing = false
        }
    }

    Column
    {
            id: channelPortraitLayout
            visible: true
            anchors.top: parent.top
            anchors.topMargin: pgHead.height
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: Theme.paddingLarge * 1.25

                Image
                {
                    id: coverImage
                    source: model ? (model.channelImageBig === "" ? model.channelImage : model.channelImageBig) : ""
                    width: Theme.itemSizeExtraLarge * 3
                    height: Theme.itemSizeExtraLarge * 3
                    sourceSize.height: 450
                    sourceSize.width: 450
                    asynchronous: true
                    smooth: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row
                {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: Theme.paddingLarge

                    IconButton
                    {
                        icon.source: !playing ? "image://theme/icon-l-play" : "image://theme/icon-l-pause"

                        onClicked:
                        {
                            if (!playing)
                            {
                                serverComm.play();
                            }
                            else
                            {
                                serverComm.pause();
                            }
                        }
                    }

                    Label
                    {
                        id: counterLabelP
                        text: "00:00"
                        font.pixelSize: Theme.fontSizeExtraLarge
                        color: playing ? Theme.highlightColor : Theme.primaryColor
                    }
                }

           Column
           {

                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                spacing: Theme.paddingSmall

                Label
                {
                    id: songLabelP
                    text: model ? model.song : ""
                    font.pixelSize: Theme.fontSizeSmall
                    font.weight: Font.Bold;
                    width: parent.width
                    wrapMode: "WordWrap"
                }

                Label
                {
                    text: "Dj: " + (model ? model.channelDj : "")
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.secondaryColor
                }

                Label
                {
                    text: model ? model.channelDescription : ""
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.secondaryColor
                    width: parent.width
                    wrapMode: "WordWrap";
                }

                Label
                {
                    text: "Listeners: " + (model ? model.channelListeners : "")
                    font.pixelSize: Theme.fontSizeSmall
                    color: Theme.secondaryColor
                }

            }
    }

}
