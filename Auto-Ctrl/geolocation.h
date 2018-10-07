#ifndef GEOLOCATION_H
#define GEOLOCATION_H


#include <QMainWindow>
#include <QWebEngineView>

class Geolocation:public QMainWindow
{
public:
    explicit Geolocation(QWidget *parent=nullptr);

private:
    QWebEngineView *m_view;
};

#endif // GEOLOCATION_H
