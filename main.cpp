
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>
#include <QQuickWindow>

#include <sailfishapp.h>
#include "servercomm.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QQuickWindow::setDefaultAlphaBuffer(true);
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    ServerComm sc;
    view->rootContext()->setContextProperty("serverComm", &sc);

    view->setSource(SailfishApp::pathTo("qml/main.qml"));
    view->show();

    return app->exec();
}
