
#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>

#include "sailfishapplication.h"
#include "servercomm.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> app(Sailfish::createApplication(argc, argv));
    QScopedPointer<QQuickView> view(Sailfish::createView("main.qml"));

    ServerComm sc;
    view->rootContext()->setContextProperty("serverComm", &sc);
    
    Sailfish::showView(view.data());
    
    return app->exec();
}
