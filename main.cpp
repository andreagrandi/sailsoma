#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QQuickView>
#include <sailfishapp.h>
#include "servercomm.h"

int main(int argc, char *argv[])
{
    /*
    QQuickWindow::setDefaultAlphaBuffer(true);
    QScopedPointer<QGuiApplication> app(Sailfish::createApplication(argc, argv));
    QScopedPointer<QQuickView> view(Sailfish::createView());

    ServerComm sc;
    view->rootContext()->setContextProperty("serverComm", &sc);

    Sailfish::setView(view.data(), "main.qml");
    Sailfish::showView(view.data());
    
    return app->exec();
    */

    // SailfishApp::main() will display "qml/template.qml", if you need more
    // control over initialization, you can use:
    //
    //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
    //   - SailfishApp::createView() to get a new QQuickView * instance
    //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
    //
    // To display the view, call "show()" (will show fullscreen on device).

    QScopedPointer<QQuickView> view(SailfishApp::createView());
    ServerComm sc;
    view->rootContext()->setContextProperty("serverComm", &sc);
    view->show();
}
