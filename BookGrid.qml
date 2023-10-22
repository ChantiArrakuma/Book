import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root

    property alias horizontalSpacing: bookGridView.horizontalSpacing

    signal bookClicked(var book)

    ListModel {
        id: testModel
        ListElement {
            bookName: "Pochemu"
            src: "./TestSrc/1.png"
            bookId: "1"
            price: "10"
            description: "bla-bla 100"

        }
        ListElement {
            bookName: "gesugao book"
            src: "./TestSrc/2.jpg"
            bookId: "2"
            price: "20"
            description: "bla-bla 200"
        }
        ListElement {
            bookName: "Yhaaaan"
            src: "./TestSrc/3.png"
            bookId: "3"
            price: "30"
            description: "bla-bla 300"
        }
        ListElement {
            bookName: "Gryu Bible"
            src: "./TestSrc/4.png"
            bookId: "4"
            price: "40"
            description: "bla-bla 400"
        }
        ListElement {
            bookName: "Yhaaaan"
            src: "./TestSrc/3.png"
            bookId: "3"
            price: "30"
            description: "bla-bla 300"
        }
        ListElement {
            bookName: "Gryu Bible"
            src: "./TestSrc/4.png"
            bookId: "4"
            price: "40"
            description: "bla-bla 400"
        }
        ListElement {
            bookName: "Yhaaaan"
            src: "./TestSrc/3.png"
            bookId: "3"
            price: "30"
            description: "bla-bla 300"
        }
        ListElement {
            bookName: "Gryu Bible"
            src: "./TestSrc/4.png"
            bookId: "4"
            price: "40"
            description: "bla-bla 400"
        }
    }

    GridView {
        id: bookGridView

        property real horizontalSpacing: 10
        property real verticalSpacing: 10

        property real preferredCellWidth: 200
        property int preferredCellCount: Math.round(width / preferredCellWidth)

        anchors.fill:parent
        model: testModel

        cellWidth: width / preferredCellCount
        cellHeight: cellWidth * 1.5

        delegate: Rectangle {
            color: altColor2
            width: GridView.view.cellWidth - GridView.view.horizontalSpacing
            height: GridView.view.cellHeight - GridView.view.verticalSpacing

            Text {
                id: bookDelegateTxt
                text: bookName
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }

            Image {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: parent.height-bookDelegateTxt.height
                source: src
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    root.bookClicked({
                        "src": model.src,
                        "name": model.bookName,
                        "id": model.bookId,
                        "price": model.price,
                        "description": model.description
                    })
                }
            }
        } // Rectangle
    }
}
