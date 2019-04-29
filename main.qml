import QtQuick 2.0
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Comandos del usuario")

    ListModel {
        id: recordsModel
    }

    StackView {
        id: stackView
        initialItem: "commands.qml"
        anchors.fill: parent
    }
}
