# Add more folders to ship with the application, here
folder_01.source = qml/machinesLobby
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01



# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    listener.cpp

QT += sql
QT += gui
QTPLUGIN += QSQLMYSQL
#INCLUDEPATH += "C:/oraclexe/app/oracle/product/11.2.0/server/oci/lib/MSVC/vc10"

#LIBS += -L"C:/Qt/Los taninos-killgabio/qextserialport/build"  -lqextserialportd

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/machinesLobby/login.qml

HEADERS += \
    listener.h
