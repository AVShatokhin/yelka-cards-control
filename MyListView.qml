import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
	id: itemRoot
	readonly property color headerBGColor: "antiquewhite"
	readonly property int numWidth: 10
	readonly property int card_idWidth: 25
	readonly property int codeWidth: 25 
	property ListView lV: listView
	property variant newCode: ""
	property int cardIdRole: 101
	property int codeRole: 102
	property int uidRole: 103

	signal newCard(variant code)

	Connections {
           target: cardsModel
    }

	ColumnLayout {
		anchors.fill: parent
		spacing:1
		Rectangle {
			Layout.fillWidth: true
			height: 30
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
		} // Rectagle (header)

		ListView {		
			id: listView
			Layout.fillWidth: true
			Layout.fillHeight: true
			clip: true
			spacing: -1
			
			model: cardsModel
			ScrollBar.vertical: ScrollBar { width: 15}
			anchors.margins: 0
			highlightFollowsCurrentItem: true
			highlightMoveVelocity: -1
			highlight: Rectangle {
					//z: 3
					height: 25
					color: 'lightblue'
			}
			focus: true
			onCurrentItemChanged: 
			{	
				listView.focus = true; 
				let modelIndex = listView.model.index(listView.currentIndex,0)
				myControlBlock.currentCardId = listView.model.data(modelIndex, cardIdRole);
				myControlBlock.currentCode = listView.model.data(modelIndex, codeRole);
			}

			Connections {
				target: itemRoot
				function onNewCard(uid) { 
					let modelIndex = listView.model.index(listView.currentIndex,0);					
					listView.model.setData(modelIndex, uid, uidRole);
					if (myControlBlock.mode == "down") {
						listView.incrementCurrentIndex();											
					} else {
						listView.decrementCurrentIndex();											
					}
					
				}
			}

			delegate: Rectangle {
				color: "transparent"
				width: ListView.view.width
				height: 25				
				Rectangle { 
					id: num
					color: "transparent"
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
					color: "transparent"
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
					color: "transparent"
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
					color: "transparent"
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
				MouseArea {
					anchors.fill: parent
					onClicked: {						
						listView.currentIndex = index
					}
				} // MouseArea
			} // delegate
		} // ListView
	} // ColumnLayOut 

	Timer {
		id: timer
        interval: 500; running: false; repeat: false
    }
	
	Keys.onDeletePressed: () => {		
		let modelIndex = listView.model.index(listView.currentIndex,0);					
		listView.model.setData(modelIndex, "", uidRole);
	}

	Keys.onPressed: (event) => { 
		if (event.text == "") return;
				
		if (timer.running == false) {
			timer.start();
			newCode = event.text;
			return;
		}
		
		newCode = newCode + event.text;			
		
		if (newCode.length == 8) {
			timer.stop();
			if (listView.currentIndex >= 0)
				newCard(newCode);			
		}						
		
	} // Keys

	
	

} // Item


