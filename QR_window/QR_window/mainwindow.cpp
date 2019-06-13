#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "src/myqrcodeheader.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    MyQRcode qrcode("daluzi",QSize(200,200));
    QPixmap pix;
    qrcode.QRCodeGenerate(pix);

    ui->label->setPixmap(pix);
    qDebug() << ui->label;

    QZXing zxing;
    QString str=zxing.decodeImage(QImage(pix.toImage()));
    ui->label_2->setText(str);
}

MainWindow::~MainWindow()
{
    delete ui;
}
