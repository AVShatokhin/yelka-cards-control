#include "root.h"

root::root(QGuiApplication *app)
	: QObject(), __app(app)
{
}

root::~root()
{
}

void root::exit()
{
	__app->quit();
}
