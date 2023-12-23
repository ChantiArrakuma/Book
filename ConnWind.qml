import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root


    Button {
        anchors.centerIn: parent
        text: qsTr("Connect")

        onClicked: {
            root.visible = false
        }
    }
}
