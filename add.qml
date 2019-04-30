import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0

Item {
    FileDialog {
        id: fileDialog
        title: qsTr("Выберите изображение")
        selectExisting: true
        nameFilters: [ "Image files (*.png *.jpg)", "All files (*)" ]
        onAccepted: {
            imageField.text = fileUrl
        }
    }

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        Label {
            text: qsTr("Путь к изображению")
        }
        RowLayout {
            TextField {
                id: imageField
                Layout.fillWidth: true
                selectByMouse: true
            }
            Button {
                Layout.preferredWidth: imageField.height
                Layout.preferredHeight: imageField.height
                text: "📁"
                padding: 0
                font.pixelSize: imageField.height/2
                onClicked: {
                    fileDialog.open()
                }
            }
        }
        Label {
            text: qsTr("Название команды")
        }
        TextField {
            id: nameField
            Layout.fillWidth: true
            selectByMouse: true
        }
        Button {
            id: save
            Layout.fillWidth: true
            text: qsTr("Сохранить")
            onClicked: {
                stackView.pop()
                recordsModel.append({"name": nameField.text, "image": imageField.text})
            }
        }
    }
}
