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
        leftItem: myListView 
        rightItem : myControlBlock
    }

    MyListView {                         
        id: myListView
        anchors.fill: parent              
    }

    MyControlBlock
    {             
        id: myControlBlock
        anchors.fill: parent
    }

    MyWindowInitCSV { id: initCSV }
}

