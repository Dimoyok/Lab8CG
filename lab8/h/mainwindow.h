#pragma once

#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>

#include <ctime>

class VTMainWindow : public  QQuickView
{
	Q_OBJECT

public:
	VTMainWindow(QWindow *parent = 0);
	~VTMainWindow();

	QRect					m_screenSize;

	bool create();
	bool isCreated()		{return m_bCreated;}

private:

	void _setupUI();
	bool	m_bCreated;
	QString m_strRootPath;

	public slots:

		void setQmlContextProperty(const QString& strPropertyName, QObject* pObject);
		void setQmlContextProperty(const QString& strPropertyName, QVariant& rValue);
};
