#include "mainwindow.h"
#include "login.h"
#include <QApplication>
#include "dbconnection.h"
#include <iostream>
#include <string>

using namespace std;
void testMysql()
{
    DBConnection *db=new DBConnection();
    QSqlDatabase newDb=db->getConnection();
    if(newDb.open())
    {
        QSqlQuery query;
        query.exec("SELECT * FROM user;");
        while(query.next()) {
           //int id = query.value(0).toInt();
            string user = query.value(0).toString().toStdString();
            string password = query.value(1).toString().toStdString();

           cout << user << ", " << password << endl;
       }

    }
}

void testOpencv()
{
    //std::string filename = "/home/Escritorio/SO/Auto-Ctrl/colors.py";
    std::string filename = "colors.py";

    std::string command = "python3 ";
    command += filename;
    system(command.c_str());
}

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    //testMysql();
    //createLoginWindow();
    //testOpencv();
    Login l;
    l.show();
    l.move(550,200);
    return a.exec();
}
