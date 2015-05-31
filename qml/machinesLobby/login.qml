import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 500
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
        id: header
        x: 0
        y: 0
        width: 500
        height: 46
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
        width: 40
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 3
        anchors.left: parent.left
        anchors.leftMargin: 3
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
        x: 69
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
        x: 69
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
        x: 69
        y: 591
        width: 362
        height: 52
        anchors.verticalCenterOffset: 217
        anchors.verticalCenter: parent.verticalCenter
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

        MouseArea {
            id: loginMouseArea
            x: 0
            y: 0
            width: 362
            height: 53
        }
    }

    Image {
        id: createAccountButton
        x: 71
        y: 679
        width: 360
        height: 52
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        source: "images/button.png"
        Text {
            id: createAccount
            color: "#b11818"
            text: qsTr("CREATE ACCOUNT")
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 8
            anchors.right: parent.right
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 33
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.topMargin: 8
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        MouseArea {
            id: createAccountMouseArea
            x: 0
            y: 0
            width: 362
            height: 53
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }

}
