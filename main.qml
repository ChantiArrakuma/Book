import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: mainWindow
    width: 600
    height: 1000

    visible: true
    title: qsTr("book")

    property color mainColor: "#e1d5c9"
    property color altColor1: "#c69351"
    property color altColor2: "#c9beb2"
    property var folderObjects: []
    property int folderCost: 0

    function refreshFolderCost() {
        var num = 0
        for(var i = 0; i < folderObjects.length; i++)
            num = num + folderObjects[i].price*1
        folderCost = num
        folderMainButton.text = folderCost
    }

    function delFromFolder(ind) {
        for(var i = 0; i < folderObjects.length; i++) {
            if(folderObjects[i].id === ind)
            {
                folderObjects.splice(i , 1)
            }
        }
        folderMainButton.clicked()
        refreshFolderCost()
    }


    Rectangle {
        id: mainBg
        anchors.fill: parent
        color: mainColor

        SearchBar {
            id: searchBarId
            height: parent.height/15
            width: parent.width*0.7
            anchors.left: parent.left

            color: parent.color
        }

        BookGrid {
            id: bookGridId
            height: parent.height
            width: parent.width * 0.7 - 20 + horizontalSpacing - 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: searchBarId.bottom
            color: parent.color

            onBookClicked: (book) => {
                bookInfoPopup.openBook(book)
            }
        }

        Flist {
            id: flistId
            height: parent.height
            width: parent.width*0.3
            anchors.right: parent.right
            Button {
                id: folderMainButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                text: folderObjects.length
                Component {
                    id: folderListModelComponent
                    ListModel {
                        id: folderModel
                    }
                }
                Component {
                    id: folderListElementComponent
                    ListElement {
                        id: folderElement
                    }
                }
                function createFolderListElement(bookId, bookName, price, imageSrc) {
                    return {
                        bookName: bookName,
                        price: price,
                        imageSrc: imageSrc,
                        bookId: bookId
                    };
                }

                onClicked: {
                    //print(folderObjects)
                    //folderMainButton.text = folderObjects.length
                    folderWindow.visible = true
                    var newModel = folderListModelComponent.createObject(mainWindow);
                    for(var i = 0; i < folderObjects.length; i++) {
                        newModel.append(createFolderListElement(folderObjects[i].id,
                                                                folderObjects[i].name,
                                                                folderObjects[i].price,
                                                                folderObjects[i].src,
                                                                ))
                    }
                    folderWindow.folderViewModel = newModel

                }
            }

        }
        Folder {
            id: folderWindow
            anchors.centerIn: parent
            height: parent.height
            width: parent.width
            visible: false
        }
    }
    ConnWind
    {
        anchors.fill: parent
        color: mainColor
    }

    BookInfoPopup {
        id: bookInfoPopup
        x: (mainWindow.width - width) / 2
        y: (mainWindow.height - height) / 2
        width: mainWindow.width - 32


        onCloseClicked: {
            close()
        }
    }

}
