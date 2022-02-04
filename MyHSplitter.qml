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
            //border.width: 1  
            
            SplitView.preferredWidth: parent.width/100 * ratio
        }

        Rectangle {
            id: rightPlaceHolder
            
            //border.width: 1
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

        //Binding {
        //    property: "text"
        //    target: test
        //    value: leftPlaceHolder.SplitView.preferredWidth
        //    restoreMode: Binding.RestoreNone
        //    when: splitView.resizing
        //}
    }
}