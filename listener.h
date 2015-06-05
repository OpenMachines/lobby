#ifndef LISTENER_H
#define LISTENER_H

#include <QObject>

class Listener : public QObject
{
    Q_OBJECT
public:
    explicit Listener(QObject *parent = 0);

signals:

public slots:
void buttonClicked(const QString& in);

};

#endif

// LISTENER_H
//class Listener : public QObject
//{
//    // This macro is required for QObject support.  You should get a compiler
//    // error if you don't include this.
//    Q_OBJECT

//public:
//    // QObjects are expected to support a parent/child hierarchy.  I've modified
//    // the constructor to match the standard.
//    explicit Listener(QObject *parent = 0);

//public slots:
//    // This method needs to take either a QString or a const reference to one.
//    // (QML doesn't support returning values via the parameter list.)
//    void buttonClicked(const QString& in);
//};
