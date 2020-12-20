#pragma once
#include <cassert>

#ifdef NDEBUG
#define connect_safe(sender, socket1, receiver, socket2) connect(sender, socket1, receiver, socket2)
#else
#define connect_safe(sender, socket1, receiver, socket2) assert( connect(sender, socket1, receiver, socket2) )
#endif

#ifdef NDEBUG
#define LINK_QXT_DYNAMIC(a) LINK_COMMON(a)
#define SUFFIX_QT_DYNAMIC "4"
#define SUFFIX_QT_STATIC ""
#else
#define LINK_QXT_DYNAMIC(a) LINK_COMMON(a  "d")
#define SUFFIX_QT_DYNAMIC "d4"
#define SUFFIX_QT_STATIC "d"
#endif

#define LINK_QTLIB_DYNAMIC(a) LINK_COMMON(a SUFFIX_QT_DYNAMIC)
#define LINK_QTLIB_STATIC(a) LINK_COMMON(a SUFFIX_QT_STATIC)
#define LINK_QT5LIB_DYNAMIC(a) LINK_QTLIB_STATIC(a)