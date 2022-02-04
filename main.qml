import QtQml

import QtQuick
import QtQuick.Controls

import QtQuick.Layouts


ApplicationWindow {
    id: mainWindow
    Connections {
           target: backEnd
    }
   
    Connections {
           target: cardsModel
    }

    width: 640
    height: 480
    visible: true
    title: qsTr("YELKA - Cards Processing Center")

    menuBar: MyMenuBar { }
    footer: MyToolBar { }
    
    MyOpenFileDialog { 
        id: openFileDialog
    }
    
    MySaveFileDialog { 
        id: saveFileDialog
    }

    MyHSplitter { 
        anchors.fill: parent
        leftItem: MyListView {             
            anchors.fill: parent              
        } 
        //rightItem : Text 
        //{ 
        //    text: "test"
        //    anchors.centerIn: parent
        //}
    }

    MyWindowInitCSV { id: initCSV }
}

