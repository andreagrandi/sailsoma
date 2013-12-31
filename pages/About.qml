import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: aboutPage

    Column
        {
            spacing: 10
            anchors.verticalCenterOffset: 3
            anchors.centerIn: parent

            Image
            {
                source: "images/SailSoma_500x500.png"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                text: "SailSoma 0.2.2"
                font.pixelSize: 48
                font.weight: Font.Bold;
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                text: "Soma.fm client for SailfishOS"
                font.pixelSize: 34
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label
            {
                text: "Released under the BSD license."
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 24
            }

            Label
            {
                text: "Andrea Grandi <a.grandi@gmail.com>"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 28
            }

            Label
            {
                text: "Filip Kłębczyk <fklebczyk@gmail.com>"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 28
            }
        }
}
