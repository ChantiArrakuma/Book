import QtQuick 2.15

Rectangle {

    Rectangle {
        anchors.centerIn: parent
        height:parent.height*0.9
        width:parent.width*0.9
        color: parent.color
        Rectangle {
            id: searchBarId
            height:parent.height*0.8
            width:parent.width*0.9
            clip: true
            TextEdit{
                id: searchText
                anchors.verticalCenter: parent.verticalCenter
                color: altColor1
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                wrapMode:Text.Wrap
            }
        }
        Rectangle {
            color: altColor1
            height:parent.height*0.8
            width:parent.height*0.8
            anchors.left: searchBarId.right
            anchors.top: searchBarId.top
        }
    }
}
