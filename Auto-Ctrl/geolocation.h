#ifndef GEOLOCATION_H
#define GEOLOCATION_H
#include <QQmlContext>
#include <QtQuick>
#include <QtCore/QDir>
#include <QtQml/QQmlEngine>
#include <QMessageBox>
#include <QtWebView/QtWebView>
#include <QUrl>
#include <QWebEngineView>
#include <QWebEnginePage>

//clase que se encarga de mostrar la geolocalizacion del auto
class Geolocation
{
public:
    Geolocation(QString);
    QString getUrl() const;
    void setUrl(const QString &value);

    QWebEnginePage *getPage() const;
    void setPage(QWebEnginePage *value);

private:
   // QString url="https://www.google.com/maps";//direccion de google maps
    QString url;
    QWebEnginePage *page = new QWebEnginePage();
};

#endif // GEOLOCATION_H
