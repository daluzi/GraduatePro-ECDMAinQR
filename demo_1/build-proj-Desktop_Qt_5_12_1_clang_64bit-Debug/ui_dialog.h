/********************************************************************************
** Form generated from reading UI file 'dialog.ui'
**
** Created by: Qt User Interface Compiler version 5.12.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOG_H
#define UI_DIALOG_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QFrame>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextEdit>

QT_BEGIN_NAMESPACE

class Ui_Dialog
{
public:
    QLineEdit *linehead;
    QFrame *frame;
    QPushButton *encode;
    QPushButton *decode;
    QLineEdit *userCnt;
    QLabel *showImg;
    QTextEdit *warn;

    void setupUi(QDialog *Dialog)
    {
        if (Dialog->objectName().isEmpty())
            Dialog->setObjectName(QString::fromUtf8("Dialog"));
        Dialog->resize(719, 490);
        linehead = new QLineEdit(Dialog);
        linehead->setObjectName(QString::fromUtf8("linehead"));
        linehead->setGeometry(QRect(-50, -11, 801, 51));
        QSizePolicy sizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(linehead->sizePolicy().hasHeightForWidth());
        linehead->setSizePolicy(sizePolicy);
        linehead->setSizeIncrement(QSize(0, 0));
        linehead->setBaseSize(QSize(0, 0));
        QFont font;
        font.setPointSize(25);
        font.setBold(true);
        font.setWeight(75);
        linehead->setFont(font);
        linehead->setLayoutDirection(Qt::LeftToRight);
        linehead->setMaxLength(32782);
        linehead->setCursorPosition(10);
        linehead->setAlignment(Qt::AlignCenter);
        linehead->setReadOnly(true);
        frame = new QFrame(Dialog);
        frame->setObjectName(QString::fromUtf8("frame"));
        frame->setGeometry(QRect(0, 40, 181, 461));
        frame->setFrameShape(QFrame::StyledPanel);
        frame->setFrameShadow(QFrame::Raised);
        frame->setLineWidth(1);
        encode = new QPushButton(frame);
        encode->setObjectName(QString::fromUtf8("encode"));
        encode->setGeometry(QRect(30, 190, 114, 39));
        QFont font1;
        font1.setFamily(QString::fromUtf8("Andale Mono"));
        font1.setPointSize(20);
        font1.setBold(true);
        font1.setItalic(false);
        font1.setWeight(75);
        encode->setFont(font1);
        encode->setMouseTracking(false);
        encode->setTabletTracking(false);
        encode->setLayoutDirection(Qt::LeftToRight);
        encode->setAutoFillBackground(false);
        encode->setInputMethodHints(Qt::ImhNone);
        decode = new QPushButton(frame);
        decode->setObjectName(QString::fromUtf8("decode"));
        decode->setGeometry(QRect(30, 330, 109, 33));
        QFont font2;
        font2.setFamily(QString::fromUtf8("Andale Mono"));
        font2.setPointSize(20);
        font2.setBold(true);
        font2.setWeight(75);
        decode->setFont(font2);
        userCnt = new QLineEdit(frame);
        userCnt->setObjectName(QString::fromUtf8("userCnt"));
        userCnt->setGeometry(QRect(7, 25, 161, 51));
        QFont font3;
        font3.setPointSize(14);
        userCnt->setFont(font3);
        userCnt->setFrame(false);
        showImg = new QLabel(Dialog);
        showImg->setObjectName(QString::fromUtf8("showImg"));
        showImg->setGeometry(QRect(330, 50, 271, 251));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy1.setHorizontalStretch(1);
        sizePolicy1.setVerticalStretch(2);
        sizePolicy1.setHeightForWidth(showImg->sizePolicy().hasHeightForWidth());
        showImg->setSizePolicy(sizePolicy1);
        showImg->setSizeIncrement(QSize(6, 5));
        showImg->setBaseSize(QSize(4, 2));
        QFont font4;
        font4.setBold(true);
        font4.setItalic(false);
        font4.setUnderline(false);
        font4.setWeight(75);
        font4.setStrikeOut(false);
        showImg->setFont(font4);
        showImg->setMouseTracking(false);
        showImg->setAutoFillBackground(true);
        showImg->setFrameShape(QFrame::StyledPanel);
        showImg->setLineWidth(5);
        showImg->setMidLineWidth(7);
        showImg->setScaledContents(false);
        showImg->setWordWrap(false);
        showImg->setMargin(16);
        showImg->setIndent(0);
        showImg->setOpenExternalLinks(false);
        warn = new QTextEdit(Dialog);
        warn->setObjectName(QString::fromUtf8("warn"));
        warn->setGeometry(QRect(330, 370, 271, 41));
        warn->setReadOnly(true);
        warn->setAcceptRichText(true);
#ifndef QT_NO_SHORTCUT
        showImg->setBuddy(showImg);
#endif // QT_NO_SHORTCUT

        retranslateUi(Dialog);

        QMetaObject::connectSlotsByName(Dialog);
    } // setupUi

    void retranslateUi(QDialog *Dialog)
    {
        Dialog->setWindowTitle(QApplication::translate("Dialog", "Dialog", nullptr));
        linehead->setText(QApplication::translate("Dialog", "qrcode-Sec", nullptr));
        encode->setText(QApplication::translate("Dialog", "encode", nullptr));
        decode->setText(QApplication::translate("Dialog", "decode", nullptr));
        userCnt->setPlaceholderText(QString());
        showImg->setText(QApplication::translate("Dialog", "QR \345\256\211\345\205\250\344\272\214\347\273\264\347\240\201--\347\224\237\346\210\220\344\270\216\351\252\214\350\257\201", nullptr));
        warn->setHtml(QApplication::translate("Dialog", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:'.SF NS Text'; font-size:13pt; font-weight:400; font-style:normal;\">\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>", nullptr));
        warn->setPlaceholderText(QApplication::translate("Dialog", "\346\217\220\347\244\272\344\277\241\346\201\257", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Dialog: public Ui_Dialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOG_H
