import QtQuick 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1
import QZXing 2.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("daluzi")

    minimumWidth: formatGroupBox.width +
                  errorCorrectionlevelGroupBox.width +
                  5 * advancedOptions.spacing

    property bool isAdvancedOptionsEnabled: advancedSwitch.position;

    //程序主界面
    Rectangle {
        id: mainLayout
        visible: true
        width: 400
        height: 400
//        color: "#222222"
        anchors {
            centerIn: parent
            margins: 10
        }
        Row {
            id: encodePress
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left

            Button {
                width: 150
                height: 150
                text: "Encode"
                background: Rectangle {
                    anchors.centerIn: parent
                    implicitWidth: 70
                    implicitHeight: 70
                    color: (Control.hovered || Control.pressed) ? "grid" : "#E0E0E0"
                }

                onClicked: mainLayout.encodeLoad()
            }
        }
        Row {
            id: decodePress
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right

            Button {

                width: 150
                height: 150
                text: "Decode"
                background: Rectangle {
                    anchors.centerIn: parent
                    color: (Control.hovered || Control.pressed) ? "#708090" : "#E0E0E0"
                    implicitWidth: 70
                    implicitHeight: 70
                }

                onClicked: mainLayout.decodeLoad()
            }
        }

        function encodeLoad() {
            mainLayout.visible = false;
            mainEncodeLayout.visible = true;
        }

        function decodeLoad() {
            mainLayout.visible = false;
            mainDecodeLayout.visible = true;
        }
    }


    //encode的主界面
    ColumnLayout {
        id: mainEncodeLayout
        visible: false
        anchors {
            fill: parent
            margins: 10
        }
        TextField {
            id: inputField
            Layout.fillWidth: true
            selectByMouse: true
            text: "Hello world!"
        }

        Row {
            Layout.fillWidth: true

            Button {
                text: "encode"
                onClicked: resultImage.source = mainEncodeLayout.getImageRequestString()
            }

            Label {
                id: resultLabel
                text: "Result qrcode image"
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                height: 1
                width: parent.width - resultLabel.width - advancedSwitch.width - 100
            }

            Switch {
                id: advancedSwitch
                text: "Advanced"
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row {
            id: advancedOptions
            Layout.fillWidth: true
            visible: mainWindow.isAdvancedOptionsEnabled
            clip: true

            spacing: 5

            GroupBox {
                id: formatGroupBox
                title: "Format"
                anchors.verticalCenter: parent.verticalCenter
                ComboBox {
                    id: formatCombo
                    model: ["qrcode"]
                }
            }

            GroupBox {
                id: errorCorrectionlevelGroupBox
                title: "Error Correction Level"
                anchors.verticalCenter: parent.verticalCenter
                ComboBox {
                    id: errorCorrectionlevelCombo
                    model: ["L", "M", "Q", "H"]
                }
            }
        }

        Rectangle {
            id: barcodeRectangle
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.width: 1
            border.color: "#bdbebf"
            clip: true

            property int imageWidth: Math.min(height, width) * 0.7;

            Image{
                id:resultImage
                anchors.centerIn: parent
                sourceSize.width: barcodeRectangle.imageWidth
                sourceSize.height: barcodeRectangle.imageWidth
//                onCacheChanged:

//                source: mainEncodeLayout.getImageRequestString()
                //cache: false;
//                resultImage.grabToImage(function(result){

//                });
            }

            Button {
                text: "back"
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    margins: 10
                }
                background: Rectangle{
                    anchors.centerIn: parent
                    color: (Control.hovered || Control.pressed) ? "#708090" : "#E0E0E0"
                    implicitWidth: 70
                    implicitHeight: 70
                }
                onClicked: mainEncodeLayout.encodeBack();
            }
        }

        function getImageRequestString() {
            if(mainWindow.isAdvancedOptionsEnabled) {
                return "image://QZXing/encode/" + inputField.text +
                            "?corretionLevel=" + errorCorrectionlevelCombo.currentText +
                            "&format=" + formatCombo.currentText
            }
            else
                return "image://QZXing/encode/" + inputField.text;
        }

        function encodeBack() {
            mainEncodeLayout.visible = false;
            mainLayout.visible = true;

        }

        Component.onCompleted: {
            console.log(resultImage.source);
        }
    }


    //decode主界面
    Rectangle {
        id: mainDecodeLayout
        visible: false
        width: 640;
        height: 480;
        anchors {
            fill: parent
            margins: 10
        }


//        BusyIndicator{
//            id: busy;
//            running: false;
//            anchors.centerIn: parent;
//            z:2;
//        }
//        Text {
//            id: stateLabel;
//            visible: false;
//            anchors.centerIn: parent;
//            z:3;
//        }
        Image {
            id: imageToDecode;
            asynchronous: true;
            cache: false;
            anchors.fill: parent;
            fillMode: Image.PreserveAspectFit;
//            onStatusChanged: {
//                if(imageToDecode.status===Image.Loading){
//                    busy.running = true;
//                    stateLabel.visible = false;
//                }
//                else if(imageToDecode.status===Image.Ready){
//                    busy.running=false;

//                }
//                else if(imageToDecode.status===Image.Error)
//                {
//                    busy.running = false;
//                    stateLabel.visible = true;
//                    stateLabel.text = "ERROR";
//                }
//            }
        }


        function decode(preview) {
            imageToDecode.source = preview
            decoder.decodeImageQML(imageToDecode);
        }


        QZXing{
            id: decoder

            enabledDecoders: QZXing.DecoderFormat_QR_CODE

            onDecodingStarted: console.log("Decoding of image started...")

            onTagFound: console.log("Barcode data: " + tag)

            onDecodingFinished: console.log("Decoding finished " + (succeeded==true ? "successfully" :    "unsuccessfully") )
        }


        Text {
            id: imagePath;
            anchors.left: openFileBtn.right;
            anchors.leftMargin: 8;
            anchors.verticalCenter: openFileBtn.verticalCenter;
            font.pixelSize: 18;
        }
        FileDialog{
            id: fileDialog;
            title: "open a picture";
            nameFilters: ["Image Files(*.jpg *.png *.gif)"];
            onAccepted: {
                console.log(fileDialog.fileUrl);
                imageToDecode.source = fileDialog.fileUrl;
                var imageFile = String(fileDialog.fileUrl);
                imagePath.text = imageFile.slice(8);
            }
        }

        Button{
            id: openFileBtn;
            text: "OPEN";
            anchors.left: parent.left;
            anchors.leftMargin: 8;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 8;
            background: Item {
                Image {
                    width: parent.width;
                    height: parent.height;
                    fillMode: Image.PreserveAspectFit;
                    source: "image/document-open.png";
                }
            }

//            background: Rectangle{
//                implicitWidth: 70;
//                implicitHeight: 25;
//                color:"#FFFFFF";
//                border.width: control.pressed?2:1;
//                border.color: (control.hovered || control.pressed)?"green":"#888888";
//            }
//            onClicked: {
//                fileDialog.open();
//                console.log(fileDialog.fileUrl);
//            }


            z:4;
        }


        Button {
            text: "back"
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: 10
            }
            background: Rectangle{
                anchors.centerIn: parent
                color: (Control.hovered || Control.pressed) ? "#708090" : "#E0E0E0"
                implicitWidth: 70
                implicitHeight: 70
            }
            onClicked: mainDecodeLayout.decodeBack();
        }

        function decodeBack() {
            mainDecodeLayout.visible = false;
            mainLayout.visible = true;
        }
    }

}
