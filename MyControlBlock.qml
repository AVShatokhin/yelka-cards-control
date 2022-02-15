import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {

    property variant mode: "down"
    property alias currentCardId: currentCard.text
    property alias currentCode: currentCode.text

    Pane {
        anchors.fill: parent
        ColumnLayout {
            anchors.fill: parent
            ToolBar {
                anchors.top: parent.top                
                height: 50
                Layout.preferredWidth: 1
                RowLayout {
                    anchors.fill: parent
                    ToolButton {
                        id: upToolButton                        
                        text: qsTr("Up Stream")                        
                        onClicked: {
                            downToolButton.toggle();
                            upToolButton.toggle();
                            mode="up";
                            myListView.lV.focus = "yes";
                        }
                    }
                    ToolButton {
                        id: downToolButton
                        text: qsTr("Down Stream")
                        checked: true
                        onClicked: {
                            downToolButton.toggle();
                            upToolButton.toggle();
                            mode="down";
                            myListView.lV.focus = "yes";
                        }
                    }
                }
            } // ToolBar
            Item {
                id: item
                Layout.fillWidth: true 
                Layout.fillHeight: true 
                ColumnLayout {
                    anchors.centerIn: parent
                    Label {
                        id: currentCard                        
                        leftPadding: 20
                        rightPadding: 20
                        Layout.alignment: Qt.AlignHCenter                        
                        font.pixelSize: 60
                        text: "CARDID"
                        background: Rectangle {
                            color: "white"
                            border.color: "green"                            
                        }
                    }
                    Item {
                        width: 20
                        height: 40
                    }
                    Label {
                        id: currentCode
                        leftPadding: 20
                        rightPadding: 20
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: 60
                        text: "CODE"  
                        background: Rectangle {
                            color: "white"
                            border.color: "green"
                        }
                    }                    
                } // ColumnLayout
            } // Item        
        } // ColumnLayout
    } // Pane
}
