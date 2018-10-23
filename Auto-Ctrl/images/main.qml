import QtQuick 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id:main
    Button
    {
        id:mybutton
        x:0
        y:0
        text: "hello"
    }
    Image {
        id: im
        x: 0
        y: 0
        width: 289
        height: 200
        source: "68321.png"
    }

}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
