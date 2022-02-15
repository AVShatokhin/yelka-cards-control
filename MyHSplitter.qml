import QtQml

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Item {
    property variant leftItem: Text { text: "Left Place Holder" }
    property variant rightItem: 
    Text {   
        id: test
        text: "Right Place Holder"
    }      
    property int ratio: 50 // в процентах задаём долю левой части сплиттера

    SplitView {
        id: splitView
        orientation: Qt.Horizontal

        anchors.fill: parent
        anchors.margins: 2   
        
        handle: Rectangle {      
            implicitWidth: 6  
            color: "darkgray"
        }

        Rectangle { 
            id: leftPlaceHolder
            SplitView.preferredWidth: parent.width/100 * ratio
            SplitView.minimumWidth: 230
        }

        Rectangle {
            id: rightPlaceHolder            
            SplitView.minimumWidth: 270
        }
        
        Binding {
            property: "parent"
            target: leftItem
            value: leftPlaceHolder
        }

        Binding {
            property: "parent"
            target: rightItem
            value: rightPlaceHolder
        }
    }
}