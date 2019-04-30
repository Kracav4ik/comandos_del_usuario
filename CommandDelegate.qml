import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

RowLayout {
    Image {
        Layout.preferredWidth: 64
        Layout.preferredHeight: 64
        fillMode: Image.PreserveAspectFit
        source: model.image
    }
    Text {
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        text : model.name
    }
    Switch { id: switcher }
    Timer {
        id: timer
        interval: 500;
        running: switcher.checked
        onTriggered: {
            switcher.checked = false
        }
    }
}
