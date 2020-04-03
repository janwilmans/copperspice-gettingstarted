#include "catch.hpp"

#ifdef _MSC_VER
#pragma warning( push )
#pragma warning(disable : 4251 4244 4250 4275)
#endif

#include <QString>
#include <QMainWindow>
#include <QApplication>
#include <QMenuBar>
#include <QStatusBar>

#include <QVBoxLayout>
#include <QtWebkit/QWebView>
#include <QMdiSubWindow>
#include <QMdiArea>
#include <QObject>

#ifdef _MSC_VER
#pragma warning( pop )
#endif

#include "stopwatch.h"

#include <thread>
#include <chrono>
#include <iostream>

using namespace std::chrono_literals;
TEST_CASE("create QWindowsFontDatabase", "[QWindowsFontDatabase]")
{
	QApplication app(__argc, __argv);
	QFont defaultFont;
	QFontMetrics fontmetrics(defaultFont);
	Stopwatch fontsize("fontsize");
	fontmetrics.size(Qt::TextShowMnemonic, "test");
}

TEST_CASE("selectionRectForSimpleText", "[Font]")
{
	QApplication app(__argc, __argv);
	QFont defaultFont;
	QFontMetrics fontmetrics(defaultFont);

	QString one("A");
	QString three("AAA");
	QString seven("AAAAAAA");
	CHECK(fontmetrics.width(one, 0) == 0);
	auto base = fontmetrics.width(one, 1);
	CHECK(fontmetrics.width(three, 1) == base);
	CHECK(fontmetrics.width(three, -1) == three.size() * base);
	CHECK(fontmetrics.width(seven, 3) == 3 * base);
	CHECK(fontmetrics.width(seven, -1) == seven.size() * base);
}

// QWebPage Assertion reproduction scenario
// ASSERT failure in int __cdecl QFontMetrics::width(const class QString8&, int, int) const: "stringToCMap should not fail twice", file ..\..\src\gui\text\qfontmetrics.cpp, line 309
TEST_CASE("selectionRectForSimpleText_BypassShaping", "[Font]")
{
	QApplication app(__argc, __argv);
	QFont defaultFont;
	QFontMetrics fontmetrics(defaultFont);

	QString one("A");
	QString three("AAA");
	QString seven("AAAAAAA");
	CHECK(fontmetrics.width(one, 0, Qt::TextBypassShaping) == 0);
	//auto base = fontmetrics.width(one, 1, Qt::TextBypassShaping);

	//CHECK(fontmetrics.width(three, 1, Qt::TextBypassShaping) == base); // assertion occurs here
	//CHECK(fontmetrics.width(three, -1, Qt::TextBypassShaping) == three.size() * base);
	//CHECK(fontmetrics.width(seven, 3, Qt::TextBypassShaping) == 3 * base);
	//CHECK(fontmetrics.width(seven, -1, Qt::TextBypassShaping) == seven.size() * base);
}
