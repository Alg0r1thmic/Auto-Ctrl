#ifndef LOGIN_H
#define LOGIN_H

#include <QWidget>
#include "dbconnection.h"
namespace Ui {
class Login;
}

class Login : public QWidget
{
    Q_OBJECT

public:
    explicit Login(QWidget *parent = nullptr);
    ~Login();

private:
    Ui::Login *ui;
    DBConnection *dbc=new DBConnection();

};

#endif // LOGIN_H
