#include "pch.h"
#include <iostream>

#pragma warning( push )
#pragma warning(disable : 4251 4275 4244)

#include <qstring.h>
#include <qmainwindow.h>
#include <qapplication.h>
#include <qmenubar.h>
#include <qstatusbar.h>

#pragma warning( pop )

#include <thread>
#include <chrono>

using namespace std::chrono_literals;

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	QMainWindow main;
	main.resize(400, 300);
	main.setWindowTitle("Hello Copperspice");

	auto menubar = main.menuBar();
	auto menu = menubar->addMenu("Options");
	auto flashAction = menu->addAction("Flash");
	auto sb = main.statusBar();
	main.show();
	sb->showMessage("This message will disappear after 2 seconds", 2000);

	//flashAction->connect([sb] { sb->showMessage("Another Flash message that will disappear after 2 seconds", 2000); });

	QString qs("Hello copperspice\n");
	std::cout << qs.toStdString();
	return app.exec();
}