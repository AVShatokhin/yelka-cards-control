#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QICon>

#include "root.h"
#include "CardsListModel.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/yelka_icon_transparent.png"));

    QQmlApplicationEngine engine;

    root * __root = new root(&app);
    
    CardsListModel* __model = new CardsListModel();
    
    QQmlContext* __context = engine.rootContext();

    __context->setContextProperty("backEnd", __root); // теперь в QML мы обращаемся к back-end'у по идентификатору 'backEnd'
    __context->setContextProperty("cardsModel", __model); 

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
