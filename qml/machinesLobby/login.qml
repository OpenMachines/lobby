import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 600
    height: 800
    color: "transparent"
    //color: "#00000000"
    //border.width: 1
    z: 2147483645
    opacity: 1
    visible: true

    Image {
        id: background
        anchors.fill: parent
        fillMode: Image.Stretch
        visible: true
        source: "images/bg.png"
    }

    MouseArea {
        id: topBarMouseArea
        height: 46
        anchors.right: parent.right
        anchors.rightMargin: 88
        anchors.left: parent.left
        anchors.leftMargin: 46
        anchors.top: parent.top
        anchors.topMargin: 0
        visible: true

        property variant previousPosition
        onPressed: {
            previousPosition = Qt.point(1, 1)
        }
        onPositionChanged: {
            if (pressedButtons == Qt.LeftButton) {
                var dx = mouseX - previousPosition.x
                var dy = mouseY - previousPosition.y
                var point = Qt.point(viewerWindow.x + dx, viewerWindow.y + dy)
                viewerWindow.setX(point.x);
                viewerWindow.setY(point.y);
            }
        }
    }

    Image {
        id: logo
        x: 3
        y: 3
        width: 40
        height: 40
        visible: true
        source: "images/OMLogoFinal.png"
    }

    Image {
        id: usernameInput
        x: 119
        y: 0
        anchors.topMargin: 248
        anchors.top: parent.top
        source: "images/inputField.png"

        Text {
            id: usernameHeader
            x: 0
            y: -36
            width: 362
            height: 30
            color: "#ffffff"
            text: qsTr("USERNAME")
            font.pixelSize: 27

            TextInput {
                id: textInput1
                x: 5
                y: 46
                width: 352
                height: 34
                color: "#ffffff"
                text: qsTr("")
                autoScroll: false
                passwordCharacter: ""
                clip: true
                horizontalAlignment: TextInput.AlignLeft
                font.pixelSize: 26
            }

            Image {
                id: xButton
                x: 443
                y: -207
                source: "images/x.png"

                MouseArea {
                    id: xMouseArea
                    x: 0
                    y: 0
                    width: 38
                    height: 38
                    onPressed: {
                        Qt.quit();
                    }
                }
            }

            Image {
                id: minimizeButton
                x: 402
                y: -205
                source: "images/minimize.png"

                MouseArea {
                    id: minimizeMouseArea
                    x: 0
                    y: 0
                    width: 35
                    height: 35
                    onPressed: {

                    }
                }
            }


        }
    }

}
