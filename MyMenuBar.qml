import QtQuick 2.9
import QtQuick.Controls 2.15


MenuBar {
        Menu {
            title: qsTr("&File")
            Action { 
                text: qsTr("Ne&w CSV") 
                onTriggered: () => { 
                        initCSV.visible = true; 
                        initCSV.x = mainWindow.x + mainWindow.width/2 - initCSV.width/2;
                        initCSV.y = mainWindow.y + mainWindow.height/2 - initCSV.height/2;    
                    }
                shortcut: "Ctrl+W"
            }            
            MenuSeparator { }
            Action { 
                text: qsTr("&Open CSV") 
                onTriggered: openFileDialog.open()
                shortcut: "Ctrl+O"
                }
            Action { 
                text: qsTr("&Save CSV") 
                onTriggered: () => { 
                    if (cardsModel.fileName == "") {
                        saveFileDialog.open();
                    } else {
                        cardsModel.saveFile();
                    }
                }
                shortcut: "Ctrl+S"
                enabled: cardsModel.edited
                }
            Action { 
                text: qsTr("Save CSV &As...") 
                shortcut: "Ctrl+A"
                enabled: cardsModel.notEmpty
                onTriggered: saveFileDialog.open()
                }
            MenuSeparator { }
            Action { 
                text: qsTr("Convert UIDs to &ENG") 
                shortcut: "Ctrl+E"
                enabled: true
                onTriggered: { 
                    console.log("aa");
                    cardsModel.convertToENG(); }
                }
            MenuSeparator { }
            Action {
                text: qsTr("&Quit")
                onTriggered: backEnd.exit()
                shortcut: "Ctrl+Q"
        }
    }
}
