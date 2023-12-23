import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root
    dim: true


    signal closeClicked()

    function openBook(book) {
        loader.setSource("qrc:/BookInfoContent.qml", {
                             "book": book,
                         })
        open()
    }

    onClosed: {
        loader.sourceComponent = undefined
    }

    padding: 20

    background: Rectangle {
        radius: 20
        color: altColor2
    }

    contentItem: Loader {
        id: loader
    }

    Connections {
        target: loader.item

        function onCloseClicked() {
            root.closeClicked()
        }
    }
}
