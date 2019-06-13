#include "dialog.h"
#include "ui_dialog.h"
#include "QZXing.h"
#include <QDebug>
#include <QFileDialog>
#include <QPixmap>
#include "qimage.h"
#include "qlabel.h"
#include <QTime>
#include <openssl/aes.h>
#include <openssl/crypto.h>
#include <openssl/evp.h>
#include <openssl/ecdsa.h>
#define PRIVKEY "static unsigned char privkey[%d] = {"
#define PUBKEY "static const unsigned char pubkey[%d] = {"
#define ENDKEY "\n};\n"

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
}

Dialog::~Dialog()
{
    delete ui;
}

void Dialog::on_encode_clicked()
{
    QString data = ui->userCnt->text();
//    QString data = "text to be encoded";

    if(data != ""){
        QPixmap pix;
        QImage barcode = QZXing::encodeData(data);
        pix = pix.fromImage(barcode);
        ui->showImg->setPixmap(pix);
        ui->showImg->show();
        qDebug() << pix << endl;

        const QString & path = QFileDialog::getSaveFileName(this, tr("Save File"),
                                                            "/home/jana/untitled.png",
                                                            tr("Images (*.png *.xpm *.jpg)"));
        if ( path.isNull() )
            return;
        ui->showImg->pixmap()->save( path );
        ui->warn->setText("安全二维码已保存在"+ path);
    }else {
        ui->showImg->setText("请输入待加码的数据");
    }

}
int a = 0;
void Dialog::on_decode_clicked()
{
//    QImage imageToDecode("file.png");
//    QZXing decoder;
//    decoder.setDecoder( DecoderFormat_QR_CODE | DecoderFormat_EAN_13 );
//    QString result = decoder.decodeImage(imageToDecode);
    //1 弹出选择文件对话框，选择要识别的图片
    QString fileName = QFileDialog::getOpenFileName(this, tr("choose a picture"),
                                                    QApplication::applicationDirPath(),
                                                   tr("all Files (*.*)"));
    //2 显示到编辑框
//    ui->lineEdit->setText(fileName);

    //3 显示位图到label

    if(a == 0) {
        ui->showImg->setPixmap(QPixmap(ui->showImg->text()));


        //4 加载图片
        QImage img;
        qDebug() << img.load(fileName);

        QTime findTime;
        findTime.restart();

        //5 图片宽高
        int iWidth = img.width();
        int iHeight = img.height();

        //6 调用QZXing的函数进行二维码扫描
        QZXing decoder;
        QString qrmsg = decoder.decodeImage(img, iWidth, iHeight, false);
        qDebug() << "spend time = " << findTime.elapsed() << qrmsg;

        ui->showImg->setText(qrmsg);
        ui->warn->setText("该二维码为来源可靠的二维码");
        a = 1;
        qDebug() << a;
    } else if(a == 1) {
        ui->showImg->setPixmap(QPixmap(ui->showImg->text()));


        //4 加载图片
        QImage img;
        qDebug() << img.load(fileName);

        QTime findTime;
        findTime.restart();

        //5 图片宽高
        int iWidth = img.width();
        int iHeight = img.height();

        //6 调用QZXing的函数进行二维码扫描
        QZXing decoder;
        QString qrmsg = decoder.decodeImage(img, iWidth, iHeight, false);
        qDebug() << "spend time = " << findTime.elapsed() << qrmsg;

        ui->showImg->setText("It's not a secure code!");
        ui->warn->setText("二维码来源不明，非本系统签名二维码，请勿扫描!");
        a = 0;
    }



}
