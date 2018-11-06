#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QQmlContext>
#include <QtQuick>
#include <QtCore/QDir>
#include <QtQml/QQmlEngine>
#include <QMessageBox>
#include <QtWebView/QtWebView>
#include <QUrl>
#include <QString>


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    car3Dinitialization();
    geoLocationInitialization();
    estadisticasInitialization();
    showConductor();
    llenar();
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
    Geolocation *geo= new Geolocation("http://192.168.43.191/Maps/maps.html");
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

    Geolocation *geo= new Geolocation("qrc:/images/index.html");
    ui->preview_2->setPage(geo->getPage());
    ui->preview_2->setUrl(geo->getUrl());
}



MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::llenar()
{

    QSqlDatabase db=this->dbc->getConnection();
    if(db.open())
    {
        QString id,presion,conductor_id,estadoAnimo,situacionid;
        QSqlQuery query;
        QString consulta="select *from  Estado_Conductor;";
        query.exec(consulta);
        while (query.next()) {
            id=QVariant(query.value(0)).toString();
            presion=query.value(1).toString();
            conductor_id=query.value(2).toString();
            estadoAnimo=query.value(3).toString();
            situacionid=query.value(4).toString();
        }
        //qDebug() << id << nombre << apellido << edad << dni ;
        ui->descripcionlineedit->setText(estadoAnimo);
        ui->fechayhoralineedit->setText("01-09-18");
        ui->gasolinalineedit->setText("50");
    }

}

void MainWindow::testOpencv()
{
    //std::string filename = "/home/Escritorio/SO/Auto-Ctrl/colors.py";
    std::string filename = "colors.py";

    std::string command = "python3 ";
    command += filename;
    system(command.c_str());
}


void MainWindow::on_pushButton_clicked()
{
    QString buscar;
    buscar=ui->buscartexedit->toPlainText();
    QSqlDatabase db=this->dbc->getConnection();
    if(db.open())
    {
        QString id,nombre,apellido,edad,dni;
        QSqlQuery query;
        QString consulta="select *from Conductor where id_conductor="+buscar+";";
        query.exec(consulta);
        while (query.next()) {
            id=QVariant(query.value(0)).toString();
            nombre=query.value(1).toString();
            apellido=query.value(2).toString();
            edad=query.value(3).toString();
            dni=query.value(4).toString();
        }
        qDebug() << id << nombre << apellido << edad << dni ;
        ui->nombrelineedit->setText(nombre);
        ui->apelidolineedit->setText(apellido);
        ui->dnilineedit->setText(dni);
        ui->idlineedit->setText(id);
        ui->edadlineedit->setText(edad);
    }

}
