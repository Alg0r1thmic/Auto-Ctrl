#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QWebEngineView>
#include <QWebEnginePage>
#include "geolocation.h"
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
    ~MainWindow();
    QUrl commandLineUrlArgument();
    
private slots:
private:
    Ui::MainWindow *ui;
    QWebEngineView *m_view;
};

#endif // MAINWINDOW_H
