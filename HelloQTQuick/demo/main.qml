import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import QtQuick.Controls.Styles 1.4


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("daluzi")

    //Rectangle {
    //    width: 300;
    //    height: 200;
    //    Item {
    //        id: gradientGroup;
    //        Rectangle {
    //            x: 20;
    //            y: 20;
    //            width: 150;
    //            height: 150;
    //            gradient: Gradient {
    //                GradientStop {position: 0.0; color: "#202020"}
    //                GradientStop {position: 1.0; color: "#A0A0A0"}
    //            }
    //        }
    //        Rectangle {
    //            x: 160;
    //            y: 20;
    //            width: 150;
    //            height: 150;
    //            rotation: 90;
    //            gradient: Gradient {
    //                GradientStop {position: 0.0; color: "#202020"}
    //                GradientStop {position: 1.0; color: "#A0A0A0"}
    //            }
    //        }
    //    }

    //    Component.onCompleted: {
    //        console.log("visible Children:" ,gradientGroup.visibleChildren.length);
    //        console.log("Children: ",gradientGroup.children.length);
    //        for(var i = 0; i < gradientGroup.children.length; i++){
    //            console.log("chile",i,"x=",gradientGroup.children[i].x);
    //        }
    //    }
    //}


//    Rectangle {
//        width: 300;
//        height: 200;
//        visible: true;

//    //    Rectangle {
//    //        id: rect1;
//    //        anchors.left: parent.left;
//    //        anchors.leftMargin: 20;
//    //        anchors.top: parent.top;
//    //        anchors.topMargin: 20;
//    //        width: 120;
//    //        height: 120;
//    //        gradient: Gradient {
//    //            GradientStop { position: 0.0; color: "#202020"; }
//    //            GradientStop { position: 1.0; color: "#A0A0A0"; }
//    //        }
//    //    }

//    //    Rectangle {
//    //        anchors.left: rect1.right;
//    //        anchors.leftMargin: 20;
//    //        anchors.top: rect1.top;
//    //        width: 120;
//    //        height: 120;
//    //        rotation: 90;
//    //        gradient: Gradient {
//    //            GradientStop { position: 0.0; color: "#202020"; }
//    //            GradientStop { position: 1.0; color: "#A0A0A0"; }
//    //        }
//    //    }

//    //    Rectangle {
//    //        x: 20;
//    //        y: 20;
//    //        width: 150;
//    //        height: 100;
//    //        color: "#606080";
//    //        z: 0.5;
//    //    }

//    //    Rectangle {
//    //        width: 100;
//    //        height: 100;
//    //        anchors.centerIn: parent;
//    //        color: "#a0c080";
//    //        z: 1;
//    //        opacity: 0.6;
//    //    }

//        color: "#c0c0c0";
//        focus: true;
//        Keys.enabled: true;
//        Keys.onEscapePressed: Qt.quit();
//        Keys.onBackPressed: Qt.quit();
//        Keys.onPressed: {
//            switch(event.key){
//            case Qt.Key_0:
//            case Qt.Key_1:
//            case Qt.Key_2:
//            case Qt.Key_3:
//            case Qt.Key_4:
//            case Qt.Key_5:
//            case Qt.Key_6:
//            case Qt.Key_7:
//            case Qt.Key_8:
//            case Qt.Key_9:
//                keyView.text = event.key - Qt.Key_0;
//                break;
//            }
//        }

//        Text {
//            id: keyView;
//            font.bold: true;
//            font.pixelSize: 24;
//            text: qsTr("text");
//            anchors.centerIn: parent;
//        }
//    }


//    Rectangle {
//        width: 300;
//        height: 200;
//        Text {
//            width: 150;
//            height: 100;
//            wrapMode: Text.WordWrap;
//            font.bold: true;
//            font.pixelSize: 24;
//            font.underline: true;
//            text: "Hello Blue Text";
//            anchors.centerIn: parent;
//            color: "blue";
//        }
//    }


//    Rectangle {
//        width: 300;
//        height: 200;
//        Text {
//            id: normal;
//            anchors.left: parent.left;
//            anchors.leftMargin: 20;
//            anchors.top: parent.top;
//            anchors.topMargin: 20;
//            font.pointSize: 24;
//            text: "Normal Text";
//        }
//        Text {
//            id: raised;
//            anchors.left: normal.left;
//            anchors.top: normal.bottom;
//            anchors.topMargin: 4;
//            font.pointSize: 24;
//            text: "Raised Text";
//            style: Text.Raised;
//            styleColor: "#AAAAAA" ;
//        }
//        Text {
//            id: outline;
//            anchors.left: normal.left;
//            anchors.top: raised.bottom;
//            anchors.topMargin: 4;
//            font.pointSize: 24;
//            text: "Outline Text";
//            style: Text.Outline;
//            styleColor: "red";
//        }
//        Text {
//            anchors.left: normal.left;
//            anchors.top: outline.bottom;
//            anchors.topMargin: 4;
//            font.pointSize: 24;
//            text: "Sunken Text";
//            style: Text.Sunken;
//            styleColor: "#A00000";
//        }
//    }


//    Rectangle {
//        anchors.fill: parent;
//        Button {
//            text: "Quit";
//            anchors.centerIn: parent;
//            style: ButtonStyle {//style现在被取消掉了，，，网上也没得说法
//                background: Rectangle {
//                    implicitWidth: 70;
//                    implicitHeight: 25;
//                    border.width: control.pressed ? 2 : 1;
//                    border.color: (control.hovered || control.pressed) ? "green" : "#888888";
//                }
//            }
//        }
//    }

    Rectangle {
        width: 480;
        height: 320;
        color: "#121212";

        BusyIndicator {
            id: busy;
            running: true;
            anchors.centerIn: parent;
            z: 2;
        }

        Label {
            id: stateLabel;
            visible: false;
            anchors.centerIn: parent;
            z: 3;
        }

        Image {
            id: imageViewer;
            asynchronous: true;
            cache: false;
            anchors.fill: parent;
            fillMode: Image.PreserveAspectFit;
            onStatusChanged: {
                if (imageViewer.status === Image.Loading) {
                    busy.running = true;
                    stateLabel.visible = false;
                }
                else if(imageViewer.status === Image.Ready){
                    busy.running = false;
                }
                else if(imageViewer.status === Image.Error){
                    busy.running = false;
                    stateLabel.visible = true;
                    stateLabel.text = "ERROR";
                }
            }
        }

        Component.onCompleted: {
            imageViewer.source = "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3128770298,107058257&fm=26&gp=0.jpg";
        }
    }
}




