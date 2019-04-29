import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        Label {
            text: qsTr("Путь к изображению")
        }
        TextField {
            id: image
            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Название команды")
        }
        TextField {
            id: name
            Layout.fillWidth: true
        }
        Button {
            id: save
            Layout.fillWidth: true
            text: qsTr("Сохранить")
            onClicked: {
                stackView.pop()
                recordsModel.append({"name": name.text, "image": image.text})
            }
        }
    }
}
