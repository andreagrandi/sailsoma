import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    property string currentChannel: ""

        SilicaListView {
            id: listView
            model: ChannelsModel {}
            delegate: ChannelsDelegate {}
            anchors.fill: parent

            BusyIndicator {
                    anchors.centerIn: parent
                    running: listView.model.status == XmlListModel.Loading
                }

            header: PageHeader {
                title: "Soma.fm channels"
            }

            PullDownMenu {
                MenuItem {
                    text: "Refresh"
                    onClicked: listView.model.reload()
                }
                MenuItem {
                    text: "About"
                    onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
                }
            }
        }
}
