#include <QGuiApplication>

#include "mainwindow.h"
#include "defs.h"

QString			g_applicationAbsPath;
const QString&	g_iconsRelativePath("/resource/images/icons/");
QString			g_iconsAbsPath;

int CALLBACK WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	int argc = 1;
	char* argv[] = { "Visualterminal" };

 	QGuiApplication application(argc, argv);

	g_applicationAbsPath = QCoreApplication::applicationDirPath();
	g_iconsAbsPath = QString("file:///") + g_applicationAbsPath + g_iconsRelativePath;

  	VTMainWindow mainWindow;

	if(!mainWindow.create())
		return -1;

	return application.exec();

	return 0;
}
