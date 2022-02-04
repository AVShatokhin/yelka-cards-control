import QtQuick
import QtQuick.Dialogs

FileDialog {
    
    title: qsTr("Open data file")
    nameFilters: [qsTr("Data file CSV (*.csv)")]
    fileMode: FileDialog.OpenFile
    onAccepted: {                   
        cardsModel.loadFile(openFileDialog.currentFile);
    }
    onRejected: {
        console.log("Canceled")            
    }
    Component.onCompleted: visible = false
}