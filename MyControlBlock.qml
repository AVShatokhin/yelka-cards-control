import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    
    Button {
        anchors.centerIn: parent
        text: "Hello, World!"
        onClicked: {
            console.log(myListView.lV.currentIndex);
            myListView.lV.currentIndex = myListView.lV.currentIndex + 1;
            console.log(myListView.lV.currentIndex);
        }
    }
}
