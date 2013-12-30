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
            //anchors.verticalCenterOffset: 5
            anchors.left: parent.left
            anchors.right: parent.right

            Item
            {
                id: songItemP
                anchors.top: parent.bottom
                anchors.topMargin: 80

                Image
                {
                    id: radioImageP
                    source: model ? (model.channelImageBig === "" ? model.channelImage : model.channelImageBig) : ""
                    width: 450
                    height: 450
                    sourceSize.height: 450
                    sourceSize.width: 450
                    asynchronous: true
                    smooth: true
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 40
                }

                Item
                {
                    anchors.top: radioImageP.bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 15

                    Label
                    {
                        id: nameLabelP
                        text: model ? model.channelName : ""
                        font.pixelSize: 34;
                        font.weight: Font.Bold;
                    }

                    Label
                    {
                        id: djLabelP
                        text: "Dj: " + (model ? model.channelDj : "")
                        font.pixelSize: 25;
                        font.weight: Font.Light;
                        anchors.top: nameLabelP.bottom
                        anchors.topMargin: 10
                    }

                    Label
                    {
                        id: descriptionLabelP
                        text: model ? model.channelDescription : ""
                        font.pixelSize: 25;
                        font.weight: Font.Light;
                        width: channelPlayer.width - 20
                        wrapMode: "WordWrap";
                        anchors.top: djLabelP.bottom
                        anchors.topMargin: 10
                    }

                    Label
                    {
                        id: listenersLabelP
                        text: "Listeners: " + (model ? model.channelListeners : "")
                        font.pixelSize: 25;
                        font.weight: Font.Light;
                        anchors.top: descriptionLabelP.bottom
                        anchors.topMargin: 10
                    }

                    Label
                    {
                        id: songLabelP
                        text: model ? model.song : ""
                        font.pixelSize: 25;
                        font.weight: Font.Bold;
                        anchors.top: listenersLabelP.bottom
                        anchors.topMargin: 10
                        width: channelPlayer.width - 30
                        wrapMode: "WordWrap"
                    }
                }
            }

            Item
            {
                id: controlRowP
                anchors.top: songLabelP.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 15

                Button
                {
                    id: playStopButtonP

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

                Label
                {
                    id: counterLabelP
                    text: "00:00"
                    anchors.left: playStopButtonP.right
                    anchors.leftMargin: 50
                    anchors.top: parent.top
                    anchors.topMargin: 15
                }
            }

        }
}
