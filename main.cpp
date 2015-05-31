#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QScreen>
#include <QQuickItem>
#include <QtQml/QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;

    viewer.setMainQmlFile(QStringLiteral("qml/machinesLobby/login.qml"));
    viewer.showExpanded();

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
