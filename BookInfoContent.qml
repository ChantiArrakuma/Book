import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ColumnLayout {
    id: root

    property var book

    signal closeClicked()

    spacing: 0

    Image {
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: 200
        Layout.preferredHeight: 300
        source: book.src
    }

    Text {
        Layout.topMargin: 10
        Layout.alignment: Qt.AlignHCenter
        text: book.name
    }

    Text {
        Layout.topMargin: 20
        text: qsTr("Описание:")
    }

    Rectangle {
        Layout.topMargin: 8
        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
        Layout.preferredHeight: 400
        color: mainColor
        border.color: "black"

        Text {
            anchors.fill: parent
            anchors.margins: 8
            text: book.description
        }
    }

    Button {
        Layout.topMargin: 20
        Layout.alignment: Qt.AlignHCenter
        palette.button: altColor1
        palette.buttonText: "white"
        text: qsTr("Add to cart %1").arg(book.price)

        onClicked: {
            mainWindow.folderObjects.push(book)
            root.closeClicked()
            refreshFolderCost()
        }
    }
}
