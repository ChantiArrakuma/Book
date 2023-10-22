import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root
    dim: true

    /*enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                properties: "scale";
                duration: 150
                from: 0.5
                to: 1.0
            }

            NumberAnimation {
                properties: "opacity";
                duration: 150
                from: 0.0
                to: 1.0
            }
        }
    }

    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                properties: "scale";
                duration: 150
                from: 1.0
                to: 0.5
            }

            NumberAnimation {
                properties: "opacity";
                duration: 150
                from: 1.0
                to: 0.0
            }
        }
    }*/


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
