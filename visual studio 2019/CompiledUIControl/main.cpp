#include <iostream>

#pragma warning( push )
#pragma warning(disable : 4251 4244 4250 4275)

#include <qstring.h>
#include <qmainwindow.h>
#include <qapplication.h>
#include <qmenubar.h>
#include <qstatusbar.h>

// any *.ui files in the project will be automatically compiled into corresponding $(OutDir)copperspice_generated\ui_*.h files.
// since $(OutDir)copperspice_generated in included in the compiler include path, this works:
#include "ui_mainwindow.h"

#pragma warning( pop )

#include <thread>
#include <chrono>
#include <atlstr.h>

using namespace std::chrono_literals;

int __stdcall WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)
{
	QApplication app(__argc, __argv);

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
