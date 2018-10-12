#ifndef LOGIN_H
#define LOGIN_H

#include <QWidget>
#include "dbconnection.h"
#include "mainwindow.h"
namespace Ui {
class Login;
}

class Login : public QWidget
{
    Q_OBJECT

public:
    explicit Login(QWidget *parent = nullptr);
    ~Login();
    bool getIsClose()
    {
        return this->isClose;
    }
private slots:
    void on_pushButton_clicked();

private:
    Ui::Login *ui;
    DBConnection *dbc=new DBConnection();
    bool isClose=false;
};

#endif // LOGIN_H
