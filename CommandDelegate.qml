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
            switcher.checked = false
            root.state = "Normal"
        }
    }

    states: [
        State {
            name: "Normal"
            StateChangeScript {
                script: {console.log("*** enter state Normal");}
            }
        },
        State {
            name: "InProgress"
            StateChangeScript {
                script: {console.log("*** enter state InProgress");}
            }
        }
    ]
    state: "Normal"

    transitions: [
        Transition {
            from: "Normal"
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
        }
    ]
}
