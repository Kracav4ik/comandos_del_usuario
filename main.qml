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
    function appendItem(name, image) {
        recordsModel.append({name: name, image: image})
        let model = []
        for (let i = 0; i < recordsModel.count; ++i) {
            let el = recordsModel.get(i)
            model.push({name: el.name, image: el.image})
        }
        saveload.saveModelText(JSON.stringify(model))
    }
    Component.onCompleted: {
        let model = JSON.parse(saveload.loadModelText());
        for (let el of model) {
            recordsModel.append(el)
        }
    }
}
