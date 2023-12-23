import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root

    color: "transparent"
    property QtObject folderViewModel
    property int folderSpacing: 10

    MouseArea {
        anchors.fill: parent
        onClicked: parent.visible = false
    }

    Rectangle {
        border.color: "black"
        border.width: 2
        clip: true
        color: mainColor
        height: parent.height*0.8
        width: parent.width*0.8
        anchors.centerIn: parent

        MouseArea {
            anchors.fill: parent
        }

        Item {
            height: parent.height - folderSpacing * 2
            width: parent.width - folderSpacing * 2
            anchors.centerIn: parent
            ListView {
                id: folderListView
                anchors.fill: parent
                model: folderViewModel ? folderViewModel : 0
                spacing: 3
                delegate:
                    Rectangle {
                        height: ListView.view.height/4
                        width: ListView.view.width
                        color: altColor1
                        Image {
                            id: folderImageElement
                            source: imageSrc
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            height: parent.height
                            width: parent.width*0.25
                        }
                        Text
                        {
                            id: folderTextElement
                            height: parent.height
                            width: parent.width*0.50
                            anchors.left: folderImageElement.right
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("\n ID: ") + bookId + qsTr("\n Name: ") + bookName + qsTr("\n Price: ") + price
                        }
                        Rectangle {
                            id: folderButtonElement
                            height: parent.height
                            width: parent.width*0.25
                            anchors.left: folderTextElement.right
                            anchors.verticalCenter: parent.verticalCenter
                            color: altColor2
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    delFromFolder(bookId)
                                }
                            }
                        }
                    }
            }
            Button {
                id: buyButton
                anchors.bottom: parent.bottom
                anchors.right: parent.right

                anchors.margins: 10*scale

                text: qsTr("Buy")
                background: Rectangle{
                    radius: 10
                    color: altColor1
                }

            }
        }
    }
}
