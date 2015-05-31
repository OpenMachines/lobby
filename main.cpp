#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QScreen>
#include <QQuickItem>
#include <QtQml/QQmlContext>

#include <QtSql>
//#include <QtCore/QCoreApplication>
#include <QtDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QString servername = "LOCALHOST";
    QString dbname = "machines_users";

    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");

    db.setConnectOptions();

    //QString dsn = QString

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
