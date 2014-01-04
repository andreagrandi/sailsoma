# The name of your app
TARGET = harbour-sailsoma

# C++ sources
SOURCES += main.cpp \
    servercomm.cpp \
    playlistreader.cpp

# C++ headers
HEADERS += servercomm.h \
    playlistreader.h

# QML files and folders
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.files = harbour-sailsoma.desktop

# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

OTHER_FILES = \
    rpm/harbour-sailsoma.spec \
    pages/SailSoma.qml \
    pages/About.qml \
    rpm/harbour-sailsoma.yaml \
    LICENSE

QT += multimedia \
    xml

icon.path = /usr/share/icons/hicolor/86x86/apps/
icon.files = harbour-sailsoma.png
INSTALLS += icon
