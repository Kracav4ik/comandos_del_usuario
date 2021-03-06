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
            clip: true
            model: recordsModel
            Layout.fillHeight: true
            Layout.fillWidth: true
            delegate: CommandDelegate {
                anchors.left: parent.left
                anchors.right: parent.right
            }
            ScrollBar.vertical: ScrollBar{ }
        }
    }
}
