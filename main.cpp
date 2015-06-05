#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"
#include <QScreen>
#include <QQuickItem>
#include <QtQml/QQmlContext>
#include <QtSql>
#include <QtDebug>
#include <QtSql/QSqlDriver>
#include "listener.h"

/* Sets up the login screen and displays it. */
void DisplayLogin(QtQuick2ApplicationViewer* viewer, QGuiApplication* app)
{
    // Set the qml file to run as the login screen.
    viewer->setMainQmlFile(QStringLiteral("qml/machinesLobby/login.qml"));

    // Display the window.
    viewer->showExpanded();

    // Set the viewer to be transparent.
    viewer->setColor("transparent");

    //QScreen* screen = app->primaryScreen();
    //const QRect mainScreenSize = screen->availableGeometry();

    //int width = mainScreenSize.width() * .7;
    //int height = mainScreenSize.height() * .7;

    //viewer.resize(width, height);

    // Remove default windows frame.
    viewer->setFlags(Qt::FramelessWindowHint);

    //viewer->setParent(0);

    // Access viewer context to move window.
    QQmlContext* context = viewer->rootContext();

    // Set a property to access through qml.
    context->setContextProperty("viewerWindow", viewer);
}

/* Opens a database with appropriate information. */
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

/* Starts and displays the application */
int main(int argc, char *argv[])
{
    // Start application.
    QGuiApplication app(argc, argv);

    // Open player database.
    bool ok = OpenDatabase("localhost", 7777, "machines_users", "root", "");

    // Did opening the database work?
    qDebug() << ok;

    // Create a viewer to control the window.
    QtQuick2ApplicationViewer viewer;

    // Display the login screen.
    DisplayLogin(&viewer, &app);

    // Reference the root object parenting the rest.
    QObject* root = viewer.rootObject();

    // Reference button to log in on click.
    QObject* loginButton = root->findChild<QObject*>("loginButton");

    // Create QObject with button function.
    Listener listener;

    // Connect the login button signal to the listener.
    QObject::connect(loginButton, SIGNAL(qmlSignal(QString)),
                        &listener, SLOT(buttonClicked(QString)));

    return app.exec();
}


