#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QQmlContext>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    QString s="w";
    ui->setupUi(this);
    ui->quickWidget->rootContext()->setContextProperty(s,this);
    ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
}

MainWindow::~MainWindow()
{
    delete ui;
}
