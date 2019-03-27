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

// in Configuration: Debug 
// these settings are required for ABI compatibility:
// - set Configuration Properties->C / C++->Preprocessor->Preprocessor Definitions = > CSDEBUG
// - set Configuration Properties->C / C++->Code Generation->Runtime Library = > Multi - threaded DLL

// for assertions to work as usual include this file:
#include "cs_assert.h"

// any *.ui files in the project will be automatically compiled into corresponding $(OutDir)copperspice_generated\ui_*.h files.
// since $(OutDir)copperspice_generated in included in the compiler include path, this works:
#include "ui_mainwindow.h"

#include <thread>
#include <chrono>
using namespace std::chrono_literals;

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QMainWindow mainWindow;
	Ui::MainWindow window;
	window.setupUi(&mainWindow);

	mainWindow.resize(400, 300);
	mainWindow.setWindowTitle("Hello Copperspice");

	auto menubar = mainWindow.menuBar();
	auto menu = menubar->addMenu("Options");
	auto flashAction = menu->addAction("Flash");
	auto assertAction = menu->addAction("Assert");
	auto sb = mainWindow.statusBar();
	mainWindow.show();
	sb->showMessage("This message will disappear after 2 seconds", 2000);

	QObject::connect(flashAction, &QAction::triggered, &mainWindow, [sb] {
		sb->showMessage("Flash message that will disappear after 2 seconds", 2000);
		});

	QObject::connect(assertAction, &QAction::triggered, &mainWindow, [] {
		assert("This is not a valid assertion" && false);
		});

	QString qs("Hello copperspice\n");
	std::cout << qs.toStdString();
	return app.exec();
}