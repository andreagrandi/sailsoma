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
        }

        onChannelLoaded:
        {
            indicator.visible = false;
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

    Item
    {
        id: channelPortraitLayout
        visible: true
        anchors.top: parent.top
        anchors.topMargin: pgHead.height
        anchors.left: parent.left
        anchors.right: parent.right

        Item
        {
            id: songItemP
            anchors.fill: parent

            Image
            {
                id: radioImageP
                source: model ? (model.channelImageBig === "" ? model.channelImage : model.channelImageBig) : ""
                width: 480
                height: 480
                asynchronous: true
                smooth: true
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                id: songLabelP
                text: model ? model.song : ""
                font.pixelSize: 25;
                font.weight: Font.Bold;
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                anchors.top: radioImageP.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
            }

            Label
            {
                id: counterLabelP
                text: "00:00"
                anchors.top: songLabelP.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            IconButton
            {
                id: playStopButtonP
                anchors.top: counterLabelP.bottom
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.right: parent.right

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
        }
    }
}
