import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    Button {
        width: parent.width
        text: qsTr("Добавить")
        onClicked:
            stackView.push("add.qml")
    }
}
