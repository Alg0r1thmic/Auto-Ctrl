#ifndef DBCONNECTION_H
#define DBCONNECTION_H
#include <QSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QVariant>
#include <QCoreApplication>

using namespace std;
//clase que se engarga de conectar a la base de datos
class DBConnection
{
public:
    DBConnection();
    QSqlDatabase getConnection();

    void fillConductor(int id,string name,string lastname,int edad,int dni);
    void fillEstadoVehiculo(string placa,double gasolina,int llantas,double temperatura,QDate,QDate);


};

#endif // DBCONNECTION_H
