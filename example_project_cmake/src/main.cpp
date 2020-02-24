#include <iostream>

#ifdef _MSC_VER
#pragma warning( push )
#pragma warning(disable : 4251 4244 4250 4275)
#endif

#include <QString>
#include <QWindow>
#include <QApplication>
#include <QMenuBar>
#include <QStatusBar>

#include "ui_mainwindow.h"

#ifdef _MSC_VER
#pragma warning( pop )
#endif

#include <thread>
#include <chrono>
#include <atlstr.h>

using namespace std::chrono_literals;

int __stdcall WinMain(HINSTANCE /*hInstance*/, HINSTANCE /*hPrevInstance*/, LPSTR /*lpCmdLine*/, int /*nShowCmd*/)
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
