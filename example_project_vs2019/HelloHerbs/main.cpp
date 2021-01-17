#include <iostream>

#pragma warning( push )
#pragma warning(disable : 4251 4244 4250 4275)

#include <QString>
#include <QMainWindow>
#include <QApplication>
#include <QMenuBar>
#include <QStatusBar>

#include <QVBoxLayout>
#include <QWebView>
#include <QMdiSubWindow>
#include <QMdiArea>


#pragma warning( pop )

#include <thread>
#include <chrono>
using namespace std::chrono_literals;

void myMessageOutput(QtMsgType type, QStringView msg) {
	return;
	switch (type) {
	case QtDebugMsg:
		fprintf(stderr, "Debug: %s\n", msg.toLatin1().data());
		break;

	case QtWarningMsg:
		fprintf(stderr, "Warning: %s\n", msg.toLatin1().data());
		break;

	case QtCriticalMsg:
		fprintf(stderr, "Critical: %s\n", msg.toLatin1().data());
		break;

	case QtFatalMsg:
		fprintf(stderr, "Fatal: %s\n", msg.toLatin1().data());
		abort();
	}
}


int main(int argc, char *argv[])
{
	qInstallMsgHandler(myMessageOutput);
	QApplication app(argc, argv);
	QMainWindow mainWindow;

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
	return 0;
}
