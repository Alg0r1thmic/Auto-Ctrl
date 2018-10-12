#include "mainwindow.h"
#include <QApplication>
#include "dbconnection.h"
void testMysql()
{
    DBConnection *db=new DBConnection();
}

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    testMysql();
    w.show();
    return a.exec();
}
