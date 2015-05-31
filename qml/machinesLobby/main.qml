import QtQuick 2.0

Rectangle {
    id: rectangle1
    width: 1280
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

    Text {
        id: text1
        x: 49
        y: 3
        text: "Hello World"
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: -390
        anchors.horizontalCenterOffset: -564
        visible: true
        anchors.centerIn: parent
    }



    MouseArea {
        id: mouseArea2
        visible: true
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 46
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }



    MouseArea {
        id: topBarMouseArea
        height: 46
        anchors.right: parent.right
        anchors.rightMargin: 8
        visible: true
        anchors.left: parent.left
        anchors.leftMargin: 218
        anchors.top: parent.top
        anchors.topMargin: 0

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
}
