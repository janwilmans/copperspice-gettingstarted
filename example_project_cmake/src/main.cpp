#include <iostream>

#include <QString>
#include <QWindow>
#include <QApplication>
#include <QMenuBar>
#include <QStatusBar>

#include "ui_mainwindow.h"

#include "extra.h"

#include <thread>
#include <chrono>
#include <cstdint>

using namespace std::chrono_literals;

#ifdef _MSC_VER
#include <atlstr.h>

int main(int argc, char *argv[]);
int APIENTRY WinMain(HINSTANCE, HINSTANCE, PSTR, INT)
{
    return main(__argc, __argv);
}
#endif

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QMainWindow mainWindow;
    Ui::MainWindow window;
    window.setupUi(&mainWindow);

    mainWindow.resize(400, 300);
    mainWindow.setWindowTitle("Hello Copperspice");

    QList<QString> list;
    list.append("quite");
    list.append("quiter");
    list.append(QString::fromUtf8("パーソナル 😱 コンピューター 😱"));

    auto menubar = mainWindow.menuBar();
    auto menu = menubar->addMenu("Options");
    auto flashAction = menu->addAction("Flash");
    auto assertAction = menu->addAction("Assert");
    auto sb = mainWindow.statusBar();
    mainWindow.show();
    sb->showMessage("This message will disappear after 2 seconds", 2000);

    QObject::connect(flashAction, &QAction::triggered, &mainWindow, [sb]
                     { sb->showMessage("Flash message that will disappear after 2 seconds", 2000); });

    QObject::connect(assertAction, &QAction::triggered, &mainWindow, []
                     { assert("This is not a valid assertion" && false); });

    QString qs("Hello copperspice\n");
    std::cout << qs.toStdString();
    return app.exec();
}

void example_linkage()
{
    example(42);
}
