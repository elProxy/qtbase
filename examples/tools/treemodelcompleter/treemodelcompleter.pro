HEADERS   = treemodelcompleter.h \
            mainwindow.h
SOURCES   = treemodelcompleter.cpp \
            main.cpp \
            mainwindow.cpp
RESOURCES = treemodelcompleter.qrc

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tools/treemodelcompleter
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS treemodelcompleter.pro resources
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/tools/treemodelcompleter
INSTALLS += target sources

QT += widgets

simulator: warning(This example might not fully work on Simulator platform)
