import QtQuick 2.0
import Sailfish.Silica 1.0

Page
{
    id: channelPlayer
    property QtObject model: null

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
            imgPlayP.visible = false;
            imgPauseP.visible = true;
        }

        onSongPaused:
        {
            imgPlayP.visible = true;
            imgPauseP.visible = false;
        }
    }

    Item
    {
        id: channelPortraitLayout
        visible: true
        anchors.fill: parent
        anchors.topMargin: 100

        Item
        {
            id: songItemP
            anchors.fill: parent

            Label
            {
                id: nameLabelP
                text: model ? model.channelName : ""
                font.pixelSize: 38;
                font.weight: Font.Bold;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
            }

            Image
            {
                id: radioImageP
                source: model ? (model.channelImageBig === "" ? model.channelImage : model.channelImageBig) : ""
                width: 480
                height: 480
                asynchronous: true
                smooth: true
                anchors.top: nameLabelP.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                id: songLabelP
                text: model ? model.song : ""
                font.pixelSize: 25;
                font.weight: Font.Bold;
                wrapMode: "WordWrap"
                anchors.top: radioImageP.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                id: counterLabelP
                text: "00:00"
                anchors.top: songLabelP.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button
            {
                id: playStopButtonP
                anchors.top: counterLabelP.bottom
                anchors.topMargin: 20
                anchors.left: parent.left
                anchors.right: parent.right

                Image
                {
                    id: imgPlayP
                    anchors.centerIn: parent
                    visible: false
                    source: "image://theme/icon-m-play"
                }

                Image
                {
                    id: imgPauseP
                    anchors.centerIn: parent
                    source: "image://theme/icon-m-pause"
                }

                onClicked:
                {
                    if (imgPlayP.visible)
                    {
                        imgPlayP.visible = false;
                        imgPauseP.visible = true;

                        serverComm.play();
                    }
                    else
                    {
                        imgPlayP.visible = true;
                        imgPauseP.visible = false;

                        serverComm.pause();
                    }
                }
            }
        }
    }
}
