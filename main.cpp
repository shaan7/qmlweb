#include "qtquick2controlsapplicationviewer.h"

int main(int argc, char *argv[])
{
    Application app(argc, argv);

    QtQuick2ControlsApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/qmlweb/main.qml"));
    viewer.show();

    return app.exec();
}
