#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include <sailfishapp.h>
#include "servercomm.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());
    ServerComm sc;
    view->rootContext()->setContextProperty("serverComm", &sc);
    view->setSource(SailfishApp::pathTo("main.qml"));
    view->showFullScreen();
    return app->exec();
}
