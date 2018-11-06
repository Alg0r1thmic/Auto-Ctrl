import QtQuick 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Window 2.10
import Qt.labs.calendar 1.0

Item {
    id:main
    width: 625
    transformOrigin: Item.TopLeft
    opacity: 1
    Image {
        id: im
        x: 0
        y: 0
        width: 302
        height: 206
        opacity: 1
        clip: false
        source: "lambor.jpg"
    }

}
