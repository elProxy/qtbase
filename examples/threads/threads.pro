TEMPLATE      = subdirs
SUBDIRS       = semaphores \
                waitconditions

!contains(QT_CONFIG, no-widgets):SUBDIRS += mandelbrot

# install
target.path = $$[QT_INSTALL_EXAMPLES]/qtbase/threads
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS threads.pro README
sources.path = $$[QT_INSTALL_EXAMPLES]/qtbase/threads
INSTALLS += target sources
