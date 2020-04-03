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

TEST_CASE("create QString", "[QString]")
{
	QString qs;
}

TEST_CASE("copy QString", "[QString]")
{
	QString qa;
	QString qb = qa;
	CHECK(qa == qb);

	QString qc;
	for (auto c: qb)
	{ 
		qc += c;
	}
	CHECK(qb == qc);
}

// 4 chars + zero termination
//#define shortStringA "aabb"
//#define shortStringB "aaBB"
//
//TEST_CASE("compare small case sensitive", "[QString]")
//{
//	QString qa(shortStringB);
//	QString qb(shortStringB);	// create identical string in separate memory locations
//	CHECK(qa.compareCaseSensitive(qb) == 0);
//	CHECK(qa.compare(qb, Qt::CaseSensitive) == 0);
//}
//
//TEST_CASE("compare small case INsensitive", "[QString]")
//{
//	QString qa(shortStringA);
//	QString qb(shortStringB);
//
//	CHECK(qa.compareCaseInsensitive(qb) == 0);
//	CHECK(qa.compareCaseInsensitive(shortStringB) == 0);
//
//	CHECK(qa.compare(qb, Qt::CaseInsensitive) == 0);
//	CHECK(qa.compare(shortStringB, Qt::CaseInsensitive) == 0);
//}

// 48 chars + zero termination
//#define longStringA "aabbccddeeffgghhaabbccddeeffgghhaabbccddeeffgghh"
//#define longStringB "aaBBccDDeeFFggHHaaBBccDDeeFFggHHaaBBccDDeeFFggHH"
//
//TEST_CASE("compare big case sensitive", "[QString]")
//{
//	QString qa(longStringB);
//	QString qb(longStringB);	// create identical string in separate memory locations
//
//	CHECK(qa.compareCaseSensitive(qb) == 0);
//	CHECK(qa.compare(qb, Qt::CaseSensitive) == 0);
//
//	CHECK(qa.compareCaseSensitive(longStringB) == 0);
//	CHECK(qa.compare(longStringB, Qt::CaseSensitive) == 0);
//}
//
//TEST_CASE("compare big case INsensitive", "[QString]")
//{
//	QString qa(longStringA);
//	QString qb(longStringB);
//	CHECK(qa.compareCaseInsensitive(qb) == 0);
//	CHECK(qa.compare(qb, Qt::CaseInsensitive) == 0);
//
//	CHECK(qa.compareCaseInsensitive(longStringB) == 0);
//	CHECK(qa.compare(longStringB, Qt::CaseInsensitive) == 0);
//}
//
//TEST_CASE("compare smaller size case sensitive", "[QString]")
//{
//	QString qa(shortStringA);
//	QString qb(longStringA);
//	CHECK(qa.compareCaseSensitive(qb) == -1);
//	CHECK(qa.compare(qb, Qt::CaseSensitive) == -1);
//
//	CHECK(qa.compareCaseSensitive(longStringA) == -1);
//	CHECK(qa.compare(longStringA, Qt::CaseSensitive) == -1);
//}
//
//TEST_CASE("compare bigger size case sensitive", "[QString]")
//{
//	QString qa(longStringA);
//	QString qb(shortStringA);
//	CHECK(qa.compareCaseSensitive(qb) == 1);
//	CHECK(qa.compare(qb, Qt::CaseSensitive) == 1);
//
//	CHECK(qa.compareCaseSensitive(shortStringB) == 1);
//	CHECK(qa.compare(shortStringB, Qt::CaseSensitive) == 1);
//}

//TEST_CASE("compare smaller size case INsensitive", "[QString]")
//{
//	QString qa(shortStringA);
//	QString qb(longStringB);
//	CHECK(qa.compareCaseInsensitive(qb) == -1);
//	CHECK(qa.compare(qb, Qt::CaseInsensitive) == -1);
//
//	CHECK(qa.compareCaseInsensitive(longStringB) == -1);
//	CHECK(qa.compare(longStringB, Qt::CaseInsensitive) == -1);
//}

//TEST_CASE("compare bigger size case INsensitive", "[QString]")
//{
//	QString qa(longStringA);
//	QString qb(shortStringB);
//	CHECK(qa.compareCaseInsensitive(qb) == 1);
//	CHECK(qa.compare(qb, Qt::CaseInsensitive) == 1);
//
//	CHECK(qa.compareCaseInsensitive(shortStringB) == 1);
//	CHECK(qa.compare(shortStringB, Qt::CaseInsensitive) == 1);
//}

// 4 chars + zero termination
//#define stringA "acb1"
//#define stringB "acb2"
//
//TEST_CASE("compare same size > case sensitive", "[QString]")
//{
//	QString qa(stringA);
//	QString qb(stringB);
//	CHECK(qa.compareCaseSensitive(qb) == -1);
//	CHECK(qa.compare(qb, Qt::CaseSensitive) == -1);
//
//	CHECK(qa.compareCaseSensitive(stringB) == -1);
//	CHECK(qa.compare(stringB, Qt::CaseSensitive) == -1);
//}
//
//TEST_CASE("compare same size < case sensitive", "[QString]")
//{
//	QString qa(stringB);
//	QString qb(stringA);
//	CHECK(qa.compareCaseSensitive(qb) == 1);
//	CHECK(qa.compare(qb, Qt::CaseSensitive) == 1);
//
//	CHECK(qa.compareCaseSensitive(stringA) == 1);
//	CHECK(qa.compare(stringA, Qt::CaseSensitive) == 1);
//}

//TEST_CASE("2k CaseInsensitive compares", "[QString]")
//{
//	QString qa(longStringA);
//	QString qb(longStringB);
//
//	Stopwatch compare2k_a("compare  (case INsensitive) 2k classic");
//	for (int i = 0; i < 2000; ++i)
//	{
//		qa.compare(qb, Qt::CaseInsensitive);
//	}
//	compare2k_a.stop();
//
//	Stopwatch compare2k_b("compare  (case INsensitive) 2k new");
//	for (int i = 0; i < 2000; ++i)
//	{
//		qa.compareCaseInsensitive(qb);
//	}
//	compare2k_b.stop();
//}
//
//TEST_CASE("2k CaseSensitive compares", "[QString]")
//{
//	QString qa(longStringA);
//	QString qb(longStringB);
//
//	Stopwatch compare2k_a("compare (case sensitive) 2k classic");
//	for (int i = 0; i < 2000; ++i)
//	{
//		qa.compare(qb, Qt::CaseSensitive);
//	}
//	compare2k_a.stop();
//
//	Stopwatch compare2k_b("compare (case sensitive) 2k new");
//	for (int i = 0; i < 2000; ++i)
//	{
//		qa.compareCaseSensitive(qb);
//	}
//	compare2k_b.stop();
//}

//TEST_CASE("selectionRectForSimpleText", "[Font]")
//{
//	QApplication app(__argc, __argv);
//	QFont defaultFont;
//	QFontMetrics fontmetrics(defaultFont);
//
//	QString one("A");
//	QString three("AAA");
//	QString seven("AAAAAAA");
//	CHECK(fontmetrics.width(one, 0) == 0);
//	auto base = fontmetrics.width(one, 1);
//	CHECK(fontmetrics.width(three, 1) == base);
//	CHECK(fontmetrics.width(three, -1) == three.size() * base);
//	CHECK(fontmetrics.width(seven, 3) == 3 * base);
//	CHECK(fontmetrics.width(seven, -1) == seven.size() * base);
//}

//// QWebPage Assertion reproduction scenario
//// ASSERT failure in int __cdecl QFontMetrics::width(const class QString8&, int, int) const: "stringToCMap should not fail twice", file ..\..\src\gui\text\qfontmetrics.cpp, line 309
//TEST_CASE("selectionRectForSimpleText_BypassShaping", "[Font]")
//{
//	QApplication app(__argc, __argv);
//	QFont defaultFont;
//	QFontMetrics fontmetrics(defaultFont);
//
//	QString one("A");
//	QString three("AAA");
//	QString seven("AAAAAAA");
//	CHECK(fontmetrics.width(one, 0, Qt::TextBypassShaping) == 0);
//	auto base = fontmetrics.width(one, 1, Qt::TextBypassShaping);
//
//	CHECK(fontmetrics.width(three, 1, Qt::TextBypassShaping) == base); // assertion occurs here
//	CHECK(fontmetrics.width(three, -1, Qt::TextBypassShaping) == three.size() * base);
//	CHECK(fontmetrics.width(seven, 3, Qt::TextBypassShaping) == 3 * base);
//	CHECK(fontmetrics.width(seven, -1, Qt::TextBypassShaping) == seven.size() * base);
//}
