import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

RowLayout {
    id: root
    Image {
        Layout.preferredWidth: 64
        Layout.preferredHeight: 64
        fillMode: Image.PreserveAspectFit
        source: model.image
    }
    Item {
        Layout.fillWidth: true
        Layout.preferredHeight: 64
        Rectangle {
            id: progress
            property real progressValue: 0
            height: parent.height
            width: parent.width * progressValue
        }
        Text {
            anchors.centerIn: parent
            text : model.name
        }
    }
    Switch {
        id: switcher
        onClicked: {
            root.state = "InProgress"
        }
    }
    Timer {
        id: timer
        interval: 500;
        running: switcher.checked
        onTriggered: {
            var succes = Math.random() < 0.5
            switcher.checked = false

            root.state = succes ? "Normal" : "Error"
        }
    }

    states: [
        State { name: "Normal" },
        State { name: "InProgress"; PropertyChanges { target: switcher; checkable: false } },
        State { name: "Error" }
    ]
    state: "Normal"

    transitions: [
        Transition {
            from: "*"
            to: "InProgress"
            SequentialAnimation {
                ScriptAction { script: { progress.progressValue = 0; progress.color = "#80ff80"; progress.opacity = 1; } }
                PropertyAnimation { target: progress; property: "progressValue"; to: 1; duration: timer.interval }
            }
        },
        Transition {
            from: "InProgress"
            to: "Normal"
            SequentialAnimation {
                PropertyAnimation { target: progress; property: "color"; to: "#00ff00"; duration: 50 }
                PropertyAnimation { target: progress; property: "opacity"; to: 0; duration: 200; easing.type: Easing.OutQuad  }
            }
        },
        Transition {
            from: "InProgress"
            to: "Error"
            SequentialAnimation {
                PropertyAnimation { target: progress; property: "color"; to: "#ff0000"; duration: 50 }
                PropertyAnimation { target: progress; property: "color"; to: "#ff8080"; duration: 200; easing.type: Easing.OutQuad  }
            }
        }
    ]
}
