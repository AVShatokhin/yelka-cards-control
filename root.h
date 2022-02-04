#pragma once

#include <QObject>
#include <QGuiApplication>

class root : public QObject
{
	Q_OBJECT

public:
	root(QGuiApplication*);
	~root();
public slots:
	void exit();

private:
	QGuiApplication* __app;

};
