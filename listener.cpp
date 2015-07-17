#include "listener.h"
#include <QDebug>

Listener::Listener(QObject *parent) :
    QObject(parent)
{

}

void Listener::buttonClicked(const QString& in)
{
    qDebug() << "clicked";
}
