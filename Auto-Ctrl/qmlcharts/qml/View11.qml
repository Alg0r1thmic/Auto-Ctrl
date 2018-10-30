import QtQuick 2.0
import QtCharts 2.0

Item {
    anchors.fill: parent

    //![1]
    ChartView {
        title: "VELOCIDAD EN EL TIEMPO"
        anchors.fill: parent
        antialiasing: true

        LineSeries {
            name: "line"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 100 }
            XYPoint { x: 1.2; y: 120 }
            XYPoint { x: 1.5; y: 140 }
            XYPoint { x: 1.8; y: 150 }
            XYPoint { x: 2.5; y: 160 }
            XYPoint { x: 3.0; y: 170 }
        }
    }
    //![1]
}
