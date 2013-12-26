import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

        SilicaListView {
            id: listView
            model: ChannelsModel {}
            delegate: ChannelsDelegate {}
            anchors.fill: parent

            header: PageHeader {
                title: "Soma.fm channels"
            }

            PullDownMenu {
                MenuItem {
                    text: "About"
                    onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
                }
            }
        }
}
