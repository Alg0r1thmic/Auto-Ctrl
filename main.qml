import QtQuick 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: main

    property real rotationValue: 0

    Scene3D {
        id: scene3D
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
        focus: true
        aspects: "input"

        Logo {
            id: watch
        }
    }

    ColumnLayout {
        id: colorLayout
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: parent.width * 0.25
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.top: scene3D.top
        spacing: 5

        Text { text: "Appearance"; font.bold: true }
        Text { text: "Ambient color RGB" }
        RowLayout {
            Text { text: "R" }
            Slider {
                id: color_r
                Layout.fillWidth: true
                minimumValue: 0
                maximumValue: 255
                value: 128
            }
        }
        RowLayout {
            Text { text: "G" }
            Slider {
                id: color_g
                Layout.fillWidth: true
                minimumValue: 0
                maximumValue: 255
                value: 195
            }
        }
        RowLayout {
            Text { text: "B" }
            Slider {
                id: color_b
                Layout.fillWidth: true
                minimumValue: 0
                maximumValue: 255
                value: 66
            }
        }
        Text { text: "Shininess" }
        Slider {
            id: shining
            Layout.fillWidth: true
            minimumValue: 30
            maximumValue: 90
            value: 50
        }
    }

    ColumnLayout {
        id: transformLayout

        anchors.left: colorLayout.left
        anchors.right: colorLayout.right
        anchors.top: colorLayout.bottom
        anchors.topMargin: 10
        spacing: 5

        Text { text: "Item transform"; font.bold: true }
        Text { text: "Rotation" }
        RowLayout {
            Text { text: "X" }
            Slider {
                id: rotation_x
                Layout.fillWidth: true
                minimumValue: -360
                maximumValue: 360
                value: rotationValue
            }
        }
        RowLayout {
            Text { text: "Y" }
            Slider {
                id: rotation_y
                Layout.fillWidth: true
                minimumValue: -360
                maximumValue: 360
                value: rotationValue
            }
        }
        RowLayout {
            Text { text: "Z" }
            Slider {
                id: rotation_z
                Layout.fillWidth: true
                minimumValue: -360
                maximumValue: 360
                value: rotationValue
            }
        }

        RowLayout {
            CheckBox {id: animation; text: "Animation"; checked: false}
        }
    }

    ColumnLayout {
        id: cameraLayout

        anchors.left: colorLayout.left
        anchors.right: colorLayout.right
        anchors.top: transformLayout.bottom
        anchors.topMargin: 10
        spacing: 5

        Text { text: "Camera"; font.bold: true }
        Text { text: "View Ctr Z: " + watch.cameraZ.toFixed(2) }
        Slider {
            id: viewCenter_z
            Layout.fillWidth: true
            minimumValue: 4
            maximumValue: 12
            value: 7.5
            onValueChanged: watch.setPositionZ(value)
        }
        Button {
            id: viewAll
            Layout.fillWidth: true
            text: "View All"
            onClicked: watch.viewLogo()
        }
    }

    SequentialAnimation {
        running: true
        paused: !animation.checked
        loops: Animation.Infinite

        NumberAnimation {
            target: main
            property: "rotationValue"
            easing.type: Easing.OutQuad
            duration: 1000
            from: 0
            to: 90
        }
        NumberAnimation {
            target: main
            property: "rotationValue"
            easing.type: Easing.OutQuad
            duration: 1000
            from: 90
            to: 180
        }
        NumberAnimation {
            target: main
            property: "rotationValue"
            easing.type: Easing.OutQuad
            duration: 1000
            from: 180
            to: 270
        }
        NumberAnimation {
            target: main
            property: "rotationValue"
            easing.type: Easing.OutQuad
            duration: 1000
            from: 270
            to: 360
        }
    }
    Button
    {
        id:mybutton
        x:0
        y:0
        text: "hello"
    }
}
