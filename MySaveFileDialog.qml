import QtQuick
import QtQuick.Dialogs

FileDialog {
    
    title: qsTr("Save data file")
    nameFilters: [qsTr("Data file CSV (*.csv)")]
    fileMode: FileDialog.SaveFile
    onAccepted: {                           
        cardsModel.saveFile(saveFileDialog.currentFile);
    }
    onRejected: {
        console.log("Canceled")            
    }
    Component.onCompleted: visible = false
}