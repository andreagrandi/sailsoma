import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: coverLabel
        anchors.centerIn: parent
        text: "SailSoma"
    }
    
    CoverActionList {
        id: coverAction
        
        CoverAction {
            iconSource: "image://theme/icon-cover-next"
        }
        
        CoverAction {
            iconSource: "image://theme/icon-cover-pause"
        }
    }
}


