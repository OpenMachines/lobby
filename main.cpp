#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QScreen>
#include <QQuickItem>
#include <QtQml/QQmlContext>
#include <QtSql>
#include <QtDebug>
#include <QtSql/QSqlDriver>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("localhost");
    db.setPort(7777);
    db.setDatabaseName("machines_users");
    db.setUserName("root");
    db.setPassword("");
    bool ok = db.open();

    qDebug() << ok;

    QtQuick2ApplicationViewer viewer;

    viewer.setMainQmlFile(QStringLiteral("qml/machinesLobby/login.qml"));
    viewer.showExpanded();

    viewer.setColor("transparent");

    QScreen* screen = app.primaryScreen();
    const QRect mainScreenSize = screen->availableGeometry();

    //int width = mainScreenSize.width() * .7;
    //int height = mainScreenSize.height() * .7;

    //viewer.resize(width, height);

    viewer.setFlags(Qt::FramelessWindowHint);

    viewer.setParent(0);

    // Access context to move window
    QQmlContext* context = viewer.rootContext();
    context->setContextProperty("viewerWindow", &viewer);

    return app.exec();
}
