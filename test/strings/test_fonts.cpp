#include "catch.hpp"

#ifdef _MSC_VER
#pragma warning( push )
#pragma warning(disable : 4251 4244 4250 4275 4127)
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
#include <QFont>
#include <qfontdatabase.h>
#include <set>


#ifdef _MSC_VER
#pragma warning( pop )
#endif

#include "stopwatch.h"

#include <thread>
#include <chrono>
#include <iostream>
#include <unordered_map>
#include <map>

__declspec(dllimport) void QString8Stats();

using namespace std::chrono_literals;

TEST_CASE("create QWindowsFontDatabase", "[QWindowsFontDatabase]")
{
	QApplication app(__argc, __argv);

	//two::QFontDatabasePrivate qfontdb;

	//qfontdb.family("test 1");
	//qfontdb.family("test 2");
	//qfontdb.family("test 3");
	//QFontDatabase db;
	//db.styles("");

	Stopwatch defaultfontTimer("font.defaultFamily()");
	QFont font;
	auto defaultFamily = font.defaultFamily();
	std::cerr << "  defaultFamily: '" << defaultFamily.toLatin1().data() << "'\n";
	CHECK(defaultFamily != "");
	defaultfontTimer.stop();

	Stopwatch dbtimer("QFontDatabase");
	QFontDatabase db;
	auto families = db.families();
	auto count = families.count();
	CHECK(count == 248);
	std::cerr << "  db.families().count2(): " << count << "\n";

	std::set<QString> uniques;
	for (const auto& f : families)
	{
		//std::cerr << "  f: " << f.toLatin1().data() << "\n";
		uniques.insert(f);
	}
	CHECK(uniques.size() == count); // checks that all the font family names are unique

	db.removeAllApplicationFonts();

}

/*
 f: Tw Cen MT
  f: Tw Cen MT Condensed
  f: Tw Cen MT Condensed Extra Bold
  f: Verdana
  f: Viner Hand ITC
  f: Vivaldi
  f: Vladimir Script
  f: Webdings
  f: Wide Latin
  f: Wingdings
  f: Wingdings 2
  f: Wingdings 3
  f: Yu Gothic
  f: Yu Gothic Light
  f: Yu Gothic Medium
  f: Yu Gothic UI
  f: Yu Gothic UI Light
  f: Yu Gothic UI Semibold
  f: Yu Gothic UI Semilight

  */