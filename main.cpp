#include "qtquick2controlsapplicationviewer.h"
#include "mousecursor.h"

int main(int argc, char *argv[])
{
    Application app(argc, argv);

    QtQuick2ControlsApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/qmlweb/main.qml"));
    viewer.show();

    //Register QML types
    qmlRegisterType<MouseCursor>("info.shaan7.qmlweb", 0, 1, "MouseCursor");

    return app.exec();
}
