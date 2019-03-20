#include <QtCore/qstring.h>
#include <iostream>

int main()
{
	QString q("Hello Herbs\n");
	std::cout << q.toStdString() << "\n";
	return 0;
}