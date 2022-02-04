import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ToolBar {
    RowLayout {
        anchors.fill: parent
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //border.width: 1
            //border.color: "darkgray"
            color: "transparent"            
            Text {
                anchors.verticalCenter: parent.verticalCenter
                leftPadding: 5
                id: fileName
                text: cardsModel.fileName
            }        
        }
        ToolSeparator { 
                Layout.fillHeight: true 
                width: 1
                
                leftPadding: 0
                rightPadding: 0
            }
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 20
            //border.width: 1
            //border.color: "darkgray"
            color: "transparent"
            Text {               
                id: edited
                anchors.centerIn: parent
                visible: cardsModel.edited
                text: "#"
            }        
        }

    }
}
