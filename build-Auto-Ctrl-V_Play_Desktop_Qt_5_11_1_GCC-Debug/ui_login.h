/********************************************************************************
** Form generated from reading UI file 'login.ui'
**
** Created by: Qt User Interface Compiler version 5.11.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LOGIN_H
#define UI_LOGIN_H

#include <QtCore/QVariant>
#include <QtGui/QIcon>
#include <QtWidgets/QApplication>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QWidget>
#include "QtQuickWidgets/QQuickWidget"

QT_BEGIN_NAMESPACE

class Ui_Login
{
public:
    QPushButton *pushButton;
    QLabel *label_2;
    QLineEdit *lineEdit;
    QLabel *label_3;
    QLineEdit *lineEdit_2;
    QQuickWidget *quickWidget;

    void setupUi(QWidget *Login)
    {
        if (Login->objectName().isEmpty())
            Login->setObjectName(QStringLiteral("Login"));
        Login->resize(501, 388);
        QIcon icon;
        icon.addFile(QStringLiteral(":/images/68321.png"), QSize(), QIcon::Normal, QIcon::Off);
        Login->setWindowIcon(icon);
        Login->setStyleSheet(QLatin1String("QWidget{\n"
"	background-color:rgb(29, 29, 29)\n"
"}"));
        pushButton = new QPushButton(Login);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(230, 330, 80, 23));
        pushButton->setStyleSheet(QLatin1String("QPushButton\n"
"{\n"
"	background-color:rgb(22, 23, 24);\n"
"	color:rgb(11, 202, 244)\n"
"}"));
        label_2 = new QLabel(Login);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(161, 211, 209, 16));
        label_2->setStyleSheet(QLatin1String("QLabel{\n"
"	color:rgb(11, 202, 244);\n"
"}"));
        lineEdit = new QLineEdit(Login);
        lineEdit->setObjectName(QStringLiteral("lineEdit"));
        lineEdit->setGeometry(QRect(161, 232, 209, 24));
        lineEdit->setStyleSheet(QLatin1String("QLineEdit\n"
"{\n"
"	color:rgb(243, 243, 243);\n"
"}"));
        label_3 = new QLabel(Login);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(161, 261, 209, 16));
        label_3->setStyleSheet(QLatin1String("QLabel{\n"
"	color:rgb(11, 202, 244)\n"
"}"));
        lineEdit_2 = new QLineEdit(Login);
        lineEdit_2->setObjectName(QStringLiteral("lineEdit_2"));
        lineEdit_2->setGeometry(QRect(161, 282, 209, 24));
        lineEdit_2->setEchoMode(QLineEdit::Password);
        quickWidget = new QQuickWidget(Login);
        quickWidget->setObjectName(QStringLiteral("quickWidget"));
        quickWidget->setGeometry(QRect(130, 30, 241, 321));
        quickWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
        quickWidget->raise();
        pushButton->raise();
        label_2->raise();
        lineEdit->raise();
        label_3->raise();
        lineEdit_2->raise();

        retranslateUi(Login);

        QMetaObject::connectSlotsByName(Login);
    } // setupUi

    void retranslateUi(QWidget *Login)
    {
        Login->setWindowTitle(QApplication::translate("Login", "Auto-Ctrl", nullptr));
        pushButton->setText(QApplication::translate("Login", "Connect", nullptr));
        label_2->setText(QApplication::translate("Login", "User", nullptr));
        label_3->setText(QApplication::translate("Login", "Password", nullptr));
    } // retranslateUi

};

namespace Ui {
    class Login: public Ui_Login {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGIN_H
