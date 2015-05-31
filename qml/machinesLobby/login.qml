import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 600
    height: 800
    color:"transparent"
    border.width: 0
    //color: "#00000000"
    //border.width: 1
    //z: 2147483645
    opacity: 1
    visible: true

    Image {
        id: background
        anchors.fill: parent
        fillMode: Image.Stretch
        visible: true
        source: "images/bg.png"
    }

    Text {
        id: text1
        x: 93
        y: 8
        width: 415
        height: 30
        text: qsTr("OM LAUNCHER")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 25
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
        id: minimizeButton
        x: 520
        y: 6
        anchors.right: parent.right
        anchors.rightMargin: 45
        source: "images/minimize.png"

        MouseArea {
            id: minimizeMouseArea
            x: 0
            y: 0
            width: 35
            height: 35
            anchors.right: parent.right
            anchors.rightMargin: 0
            onPressed: {
                viewerWindow.Minimized = true;
            }
        }
    }

    Image {
        id: xButton
        x: 555
        y: 5
        anchors.right: parent.right
        anchors.rightMargin: 7
        source: "images/x.png"

        MouseArea {
            id: xMouseArea
            x: 0
            y: 0
            width: 38
            height: 38
            anchors.right: parent.right
            anchors.rightMargin: 0
            onPressed: {
                Qt.quit();
            }
        }
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
                id: usernameTextInput
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


        }
    }


    Image {
        id: passwordInput
        x: 119
        y: -2
        source: "images/inputField.png"
        Text {
            id: passwordHeader
            x: 0
            y: -36
            width: 362
            height: 30
            color: "#ffffff"
            text: qsTr("PASSWORD")
            font.pixelSize: 27
            TextInput {
                id: passwordTextInput
                x: 5
                y: 46
                width: 352
                height: 34
                color: "#ffffff"
                text: qsTr("")
                horizontalAlignment: TextInput.AlignLeft
                clip: true
                font.pixelSize: 26
                autoScroll: false
                passwordCharacter: ""
            }
        }
        anchors.topMargin: 374
        anchors.top: parent.top
    }





    Image {
        id: loginButton
        x: 238
        width: 362
        anchors.top: parent.top
        anchors.topMargin: 658
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 89
        anchors.left: parent.left
        anchors.leftMargin: 119
        anchors.right: parent.right
        anchors.rightMargin: 119
        source: "images/button.png"

        Text {
            id: login
            color: "#b11818"
            text: qsTr("LOGIN")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 33
        }
    }

}
