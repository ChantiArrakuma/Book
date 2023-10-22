import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    radius: 2
    color: altColor1

    ListModel {
        id: testFilterModel

        ListElement {
            fltr: "Романтика"
        }
        ListElement {
            fltr: "Боевик"
        }
        ListElement {
            fltr: "Детектив"
        }
        ListElement {
            fltr: "Философия"
        }
    }

        ButtonGroup {
             id: buttonGroup
         }

        ListView {
            objectName: "flistListViewName"
            id: fListListView
            height: root.height
            width: root.width
            anchors.top: logo.bottom
            anchors.topMargin: 10
            model: testFilterModel
            spacing: 5
            delegate:
                RadioDelegate {
                    id: sourceItem
                    height: 30
                    width: ListView.view.width
                    ButtonGroup.group: buttonGroup
                    indicator:
                        Rectangle {
                        anchors.fill:parent
                        color: sourceItem.checked ? "#ab7836" : "#c69351"
                        Text
                        {
                            anchors.centerIn: parent
                            color: mainColor
                            text: fltr
                            font.pointSize: mainWindow.height/50 //QFont::setPointSizeF: Point size <= 0 (0.000000), must be greater than 0
                            font.family: "Lucida console"
                            font.bold: true
                        }
                        MouseArea {
                            anchors.fill:parent
                            onClicked: sourceItem.checked = true
                        }
                    }

                }
        }
        Rectangle
        {
            id: logo
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            height: root.height/5
            width: root.width*0.8
            color: mainColor
            //radius: 10
        }
}

