#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QScreen>
#include <QQuickItem>
#include <QtQml/QQmlContext>
#include <QtSql>
#include <QtDebug>
#include <QtSql/QSqlDriver>

/* Sets up the login screen and displays it. */
void DisplayLogin(QtQuick2ApplicationViewer* viewer, QGuiApplication* app)
{
    viewer->setMainQmlFile(QStringLiteral("qml/machinesLobby/login.qml"));
    viewer->showExpanded();

    viewer->setColor("transparent");

    QScreen* screen = app->primaryScreen();
    const QRect mainScreenSize = screen->availableGeometry();

    //int width = mainScreenSize.width() * .7;
    //int height = mainScreenSize.height() * .7;

    //viewer.resize(width, height);

    viewer->setFlags(Qt::FramelessWindowHint);

    viewer->setParent(0);

    // Access context to move window
    QQmlContext* context = viewer->rootContext();
    context->setContextProperty("viewerWindow", viewer);
}


bool OpenDatabase(QString hostName, int port, QString databaseName, QString userName, QString password)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(hostName);
    db.setPort(port);
    db.setDatabaseName(databaseName);
    db.setUserName(userName);
    db.setPassword(password);
    bool ok = db.open();

    return ok;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    bool ok = OpenDatabase("localhost", 7777, "machines_users", "root", "");

    qDebug() << ok;

    QtQuick2ApplicationViewer viewer;

    DisplayLogin(&viewer, &app);

    return app.exec();
}

