import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: initCSV
    transientParent: mainWindow
    title: qsTr("Init model")
    modality: Qt.ApplicationModal
    visible: false
    width: 300
    height: 150
    flags: Qt.Dialog
    Pane {
        anchors.fill: parent
    ColumnLayout {
        id: column
        anchors.fill: parent
        spacing: 20
        
        RowLayout {
            width: initCSV.width
            spacing: 1
            Text {
                text: qsTr("First card_id [1; 999999]")
            } 
            Item {
                Layout.fillWidth: true 
            }
            Rectangle {
                width: 70
                height: 20
                border.color: "black"
                border.width: 1
                color: "white"
                clip: true
                radius: 3
                TextInput {
                    width: 70
                    height: 20
                    id: firstCard
                    maximumLength: 6
                    anchors.centerIn: parent
                    text: "50000"
                    horizontalAlignment: TextInput.AlignHCenter
                    validator: IntValidator{bottom: 1; top: 999999; }
                }            
            }
        }

        RowLayout {
            width: initCSV.width
            spacing: 1
            Text {
                text: qsTr("Cards count [1; 9999]")
            }
            Item {
                Layout.fillWidth: true 
            }
            
            Rectangle {
                width: 70
                height: 20
                border.color: "black"
                border.width: 1
                color: "white"
                clip: true
                radius: 3
                TextInput {
                    width: 70
                    height: 20
                    id: cardsCount
                    maximumLength: 4
                    anchors.centerIn: parent
                    text: "100"
                    horizontalAlignment: TextInput.AlignHCenter
                    validator: IntValidator{bottom: 1; top: 9999;}
                }            
            }
        }


        Item {
            Layout.fillHeight: true                
        }

        RowLayout {
            width: initCSV.width
            spacing: 1
            
            Item {
                Layout.fillWidth: true                    
            }
            Button {                
                text: "OK"
                Layout.preferredWidth: 50        
                onClicked: () => {
                    if (cardsCount.text == "") return;
                    if (firstCard.text == "") return;
                    myListView.lV.currentIndex=-1;
                    cardsModel.initModel(firstCard.text, cardsCount.text); 
                    initCSV.visible = false;
                }
            }    
            Button {
                text: "Cancel"
                Layout.preferredWidth: 50     
                onClicked: initCSV.visible = false
            }    

        }
    }
    }
}