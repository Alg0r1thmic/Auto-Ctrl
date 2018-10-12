#include "login.h"
#include "ui_login.h"
#include <QApplication>
#include <QDebug>
Login::Login(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Login)
{
    ui->setupUi(this);
}

Login::~Login()
{
    delete ui;
}

void Login::on_pushButton_clicked()
{
    QString user,password;
    QString inputUser=ui->lineEdit->text();
    QString inputPassword=ui->lineEdit_2->text();
    QSqlDatabase newDb=this->dbc->getConnection();
    if(newDb.open())
    {
        QSqlQuery query;
        query.exec("SELECT * FROM user;");
        QString consulta="select user,password from user where user= '"+ inputUser+ "' AND password = '"+inputPassword+"'";
        //query.exec(" select user,password from user where(user='raul') AND password='spaceman'");
        query.exec(consulta);
        while(query.next()) {
            user=query.value(0).toString();
            password=query.value(1).toString();
        }
        qDebug() << consulta ;
    }
    if((inputUser == user) and (password==inputPassword))
    {
        this->close();
        MainWindow *w = new MainWindow();
        w->show();
        w->move(300,100);
    }

}
