#include "dbconnection.h"
#include <iostream>
#include <string>
#include <QDebug>
using namespace std;

DBConnection::DBConnection()
{
    /*
    if (QSqlDatabase::isDriverAvailable("QMYSQL")) {

        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
        db.setHostName("localhost");
        db.setPort(3306);
        db.setUserName("root");
        db.setPassword("");
        db.setDatabaseName("car");
        if(db.open())
        {
            QSqlQuery query;
            query.exec("SELECT * FROM Carros ;");
            while(query.next()) {
               int id = query.value(0).toInt();

               string name = query.value(1).toString().toStdString();

               cout << id << ", " << name << endl;
           }
        }
    }
    else
        cout << "no disponible";
    */
}

QSqlDatabase DBConnection::getConnection()
{
    if (QSqlDatabase::isDriverAvailable("QMYSQL")) {

        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
        db.setHostName("localhost");
        db.setPort(3306);
        db.setUserName("root");
        db.setPassword("");
        db.setDatabaseName("AutoCtrl");
        return db;
    }
}

