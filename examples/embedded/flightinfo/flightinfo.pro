TEMPLATE = app
TARGET = flightinfo
SOURCES = flightinfo.cpp
FORMS += form.ui
RESOURCES = flightinfo.qrc
QT += network widgets

target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/embedded/flightinfo
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS *.pro
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/embedded/flightinfo
INSTALLS += target sources
