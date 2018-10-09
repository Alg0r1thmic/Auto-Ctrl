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

class Geolocation
{
public:
    Geolocation();
    QString getUrl() const;
    void setUrl(const QString &value);

    QWebEnginePage *getPage() const;
    void setPage(QWebEnginePage *value);

private:
    QString url="https://www.google.com/maps";
    QWebEnginePage *page = new QWebEnginePage();
};

#endif // GEOLOCATION_H
