#include "geolocation.h"
Geolocation::Geolocation(QString ss)
    :url(ss)
{
    QWebEnginePage *page= new QWebEnginePage();

}

QString Geolocation::getUrl() const
{
    return url;
}

void Geolocation::setUrl(const QString &value)
{
    url = value;
}

QWebEnginePage *Geolocation::getPage() const
{
    return this->page;
}

void Geolocation::setPage(QWebEnginePage *value)
{
    page = value;
}
