#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QWebEngineView>
#include <QWebEnginePage>
#include "geolocation.h"
#include "dbconnection.h"
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    void car3Dinitialization();
    void geoLocationInitialization();
    void estadisticasInitialization();
    void showConductor();
    ~MainWindow();
    QUrl commandLineUrlArgument();
    
    void llenar();
    void testOpencv();
private slots:
    void on_pushButton_clicked();


private:
    Ui::MainWindow *ui;
    QWebEngineView *m_view;
    DBConnection *dbc=new DBConnection();

};

#endif // MAINWINDOW_H
