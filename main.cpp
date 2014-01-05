#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QQuickView>
#include <QQmlContext>
#include <sailfishapp.h>
#include "servercomm.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QQuickView> view(SailfishApp::createView());
    ServerComm sc;
    view->rootContext()->setContextProperty("serverComm", &sc);
    view->setSource(SailfishApp::pathTo("main.qml"));
    view->show();
}
