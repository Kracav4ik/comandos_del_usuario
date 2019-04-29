import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    ColumnLayout {
        anchors.fill: parent
        Button {
            width: parent.width
            text: qsTr("Добавить")
            Layout.fillWidth: true
            onClicked:
                stackView.push("add.qml")
        }
        ListView {
            model: recordsModel
            Layout.fillHeight: true
            delegate: RowLayout {
                anchors.left: parent.left
                anchors.right: parent.right
                Text {text : "name is " + name}
                Text {text : "image is " + image}
            }
        }
    }
}
