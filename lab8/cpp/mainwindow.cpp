#include <QScreen>
#include "mainwindow.h"

const QString c_strRootQMLPath = "qrc:/qml/src/main.qml";

extern QString g_applicationAbsPath;
extern QString g_iconsAbsPath;

// NOTE: Qt message handler

void debugMessageDisplayFunc(QtMsgType type, const char *msg)
{
	const char* msgTypeStr = NULL;

	switch (type)
	{
	case QtDebugMsg:
		msgTypeStr = "Debug: ";
		break;
	case QtWarningMsg:
		msgTypeStr = "Warning: ";
		break;
	case QtCriticalMsg:
		msgTypeStr = "Critical: ";
		break;
	case QtFatalMsg:
		msgTypeStr = "Fatal: ";
	default:
		return;
	}

	OutputDebugString((LPCWSTR)msgTypeStr);
	OutputDebugString((LPCWSTR)msg);
	OutputDebugString((LPCWSTR)"\n");
}

VTMainWindow::VTMainWindow(QWindow *parent)
	: QQuickView(parent)
{}

VTMainWindow::~VTMainWindow() 
{}

bool VTMainWindow::create()
{
	srand ( time(NULL) );

	setQmlContextProperty("extern_mainWindow", this);

	setQmlContextProperty("extern_screenWidth", QVariant(screen()->availableGeometry().width() - 15) );
	setQmlContextProperty("extern_screenHeight", QVariant(screen()->availableGeometry().height() - 39) );

	setQmlContextProperty("extern_appPath", QVariant(g_applicationAbsPath) );
	setQmlContextProperty("extern_iconsAbsPath", QVariant(g_iconsAbsPath) );

	setMinimumSize(QSize(970, 530));
	setResizeMode(QQuickView::SizeRootObjectToView);

	m_strRootPath = "./";
	_setupUI();

	show();

	

	m_bCreated = true;
	return m_bCreated;
}

void VTMainWindow::setQmlContextProperty(const QString& strPropertyName, QObject* pObject)
{
	rootContext()->setContextProperty(strPropertyName, pObject);
}

void VTMainWindow::setQmlContextProperty(const QString& strPropertyName, QVariant& rValue)
{
	rootContext()->setContextProperty(strPropertyName, rValue);
}

void VTMainWindow::_setupUI()
{
	setSource(QUrl(c_strRootQMLPath));
}
