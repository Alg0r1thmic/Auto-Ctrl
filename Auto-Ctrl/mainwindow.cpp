#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QQmlContext>
#include <QtQuick>
#include <QtCore/QDir>
#include <QtQml/QQmlEngine>
#include <QMessageBox>
#include <QtWebView/QtWebView>
#include <QUrl>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    car3Dinitialization();
    geoLocationInitialization();
    estadisticasInitialization();
}

void MainWindow::car3Dinitialization()
{
    QString s="w";
    ui->setupUi(this);
    ui->quickWidget->rootContext()->setContextProperty(s,this);
    ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/3DcarQml/main.qml")));

}

void MainWindow::geoLocationInitialization()
{
    Geolocation *geo= new Geolocation();
    ui->preview->setPage(geo->getPage());
    ui->preview->setUrl(geo->getUrl());
}

void MainWindow::estadisticasInitialization()
{
    QString s="w";
    ui->quickWidget_2->rootContext()->setContextProperty(s,this);
    ui->quickWidget_2->setSource(QUrl(QStringLiteral("qrc:/qmlcharts/qml/chartMain.qml")));
}

void MainWindow::showConductor()
{
    QSqlDatabase db=this->dbc->getConnection();
    if(db.open())
    {
        QString id,nombre,apellido,edad,dni;
        QSqlQuery query;
        QString consulta="select *from Conductor where id_conductor=1";
        query.exec(consulta);
        while (query.next()) {

        }
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}


