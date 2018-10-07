//![1]
import QtQuick 2.0
//![1]

Item {
    width: 600
    height: 400

    MainForm {
        anchors.fill: parent
        // Hide the default info text once view changes away from the first view
        onCurrentIndexChanged: {
            if (info.opacity > 0.0) {
                if (sourceLoaded)
                    info.opacity = 0.0;
                else if (currentIndex != 0)
                    currentIndex = 0;
            }
        }

        Behavior on info.opacity {
            NumberAnimation { duration: 400 }
        }
    }
}
