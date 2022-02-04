import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
	readonly property color headerBGColor: "antiquewhite"
	readonly property int numWidth: 10
	readonly property int card_idWidth: 25
	readonly property int codeWidth: 25

	Connections {
           target: cardsModel
    }

	ColumnLayout {
		anchors.fill: parent
		spacing:1
		Rectangle {
			Layout.fillWidth: true
			height: 30
			//anchors.leftMargin: 1
			//anchors.rightMargin: 2
			Rectangle { 
				id: num
				width: numWidth*parent.width/100
				height: parent.height
				border.color: "black"
				color: headerBGColor
				radius: 3
				Text {
					anchors.centerIn: parent
					text: "#"
				}		
			}

			Rectangle { 
				id: card_id
				width: card_idWidth*parent.width/100
				height: parent.height
				anchors.left: num.right
				anchors.leftMargin: -1
				border.color: "black"
				color: headerBGColor
				radius: 3
				Text {
					anchors.centerIn: parent
					text: "CARD_ID"
				}		
			}
			Rectangle { 
				id: code
				width: codeWidth*parent.width/100
				height: parent.height
				anchors.left: card_id.right
				anchors.leftMargin: -1
				border.color: "black"
				color: headerBGColor
				radius: 3
				Text {
					anchors.centerIn: parent
					text: "CODE"
				}		
			}
			Rectangle { 
				id: uid
				anchors.left: code.right				
				anchors.right: parent.right
				height: parent.height
				border.color: "black"
				anchors.leftMargin: -1
				anchors.rightMargin: 1
				color: headerBGColor
				radius: 3
				Text {
					anchors.centerIn: parent
					text: "UID"
				}		
			}

		}
		ListView {		
			Layout.fillWidth: true
			Layout.fillHeight: true
			clip: true
			spacing: -1
			//model: listModel
			model: cardsModel
			ScrollBar.vertical: ScrollBar {id: scrollBar}
			anchors.margins: 0
			delegate: Rectangle {
		
				width: ListView.view.width
				height: 20

				Rectangle { 
					id: num
					width: numWidth*parent.width/100	
					height: parent.height
					border.color: "black"
					anchors.leftMargin: -1
					Text {
						anchors.centerIn: parent
						text: model.num
					}		
				}

				Rectangle { 
					id: card_id
					width: card_idWidth*parent.width/100
					height: parent.height
					anchors.left: num.right
					border.color: "black"
					anchors.leftMargin: -1
					Text {
						anchors.centerIn: parent
						text: model.card_id
					}		
				}
				Rectangle { 
					id: code
					width: codeWidth*parent.width/100
					height: parent.height
					anchors.left: card_id.right
					border.color: "black"
					anchors.leftMargin: -1
					Text {
						anchors.centerIn: parent
						text: model.code
					}		
				}
				Rectangle { 
					id: uid
					anchors.left: code.right				
					anchors.right: parent.right
					height: parent.height
					border.color: "black"
					anchors.leftMargin: -1
					anchors.rightMargin: 1
					Text {
						anchors.centerIn: parent
						text: model.uid
					}		
				}
	
			}

			ListModel {
				id: listModel

				ListElement {
					num: 1
					card_id: "11"
					uid: "u11id"
					code: "co11de"
				}

				ListElement {
					num: 2
					card_id: "11"
					uid: "u11id"
					code: "co11de"
				}

				ListElement {
					num: 3
					card_id: "35678"
					uid: "0000afffcdea"
					code: 1122
				}
				ListElement {
					num: 4
					card_id: "1212444"
					uid: "0000afffcdea"
					code: 3322
				}
				ListElement {
					num: 4
					card_id: "1212444"
					uid: "0000afffcdea"
					code: 3322
				}
				ListElement {
					num: 4
					card_id: "1212444"
					uid: "0000afffcdea"
					code: 3322
				}
				ListElement {
					num: 4
					card_id: "1212444"
					uid: "0000afffcdea"
					code: 3322
				}
			}
		}
	}
}


