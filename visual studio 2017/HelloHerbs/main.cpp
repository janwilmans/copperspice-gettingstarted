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

// The 
// Configuration: Debug
// - set Configuration Properties->C / C++->Preprocessor->Preprocessor Definitions = > NDEBUG
// - set Configuration Properties->C / C++->Code Generation->Runtime Library = > Multi - threaded DLL

#include <thread>
#include <chrono>

using namespace std::chrono_literals;

class Dummy
{
public:
	Dummy(QStatusBar* sb) : sb(sb) {}
	void triggered()
	{
		sb->showMessage("Another Flash message that will disappear after 2 seconds", 2000);
	}

	QStatusBar* sb;
};

int main(int argc, char *argv[])
{
	assert(false);
	QApplication app(argc, argv);
	QMainWindow mainWindow;
	mainWindow.resize(400, 300);
	mainWindow.setWindowTitle("Hello Copperspice");

	auto menubar = mainWindow.menuBar();
	auto menu = menubar->addMenu("Options");
	auto flashAction = menu->addAction("Flash");
	auto sb = mainWindow.statusBar();
	mainWindow.show();
	sb->showMessage("This message will disappear after 2 seconds", 2000);

	connect(*flashAction, &QAction::triggered, mainWindow, [sb] { 
		sb->showMessage("Another Flash message that will disappear after 2 seconds", 2000);
	});

	QString qs("Hello copperspice\n");
	std::cout << qs.toStdString();
	return app.exec();
}