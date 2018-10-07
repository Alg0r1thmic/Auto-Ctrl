#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <geolocation.h>
#include <QMainWindow>
#include <QWebEngineView>
#include <QWebEnginePage>
namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    QUrl commandLineUrlArgument();
    
private slots:
private:
    Ui::MainWindow *ui;
    QWebEngineView *m_view;
};

#endif // MAINWINDOW_H
