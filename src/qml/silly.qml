import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true

    Button {
        anchors.fill: parent
        spacing: 20
        text: qsTr("greeting")
    }
}
