# The name of your app
TARGET = harbour-sailsoma

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

CONFIG += sailfishapp

# C++ sources
SOURCES += main.cpp \
    servercomm.cpp \
    playlistreader.cpp

# C++ headers
HEADERS += servercomm.h \
    playlistreader.h

# QML files
DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.path = $$DEPLOYMENT_PATH
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.path = /usr/share/applications
desktop.files = harbour-sailsoma.desktop

OTHER_FILES = \
    main.qml \
    pages/SailSoma.qml \
    pages/About.qml \
    pages/ChannelPlayer.qml \
    pages/ChannelsDelegate.qml \
    pages/ChannelsModel.qml \
    pages/images/SailSoma_500x500.png \
    cover/CoverPage.qml \
    cover/sailsoma.png \
    rpm/harbour-sailsoma.spec \
    rpm/harbour-sailsoma.yaml \
    LICENSE \
    harbour-sailsoma.desktop

QT += multimedia xml

icon.path = /usr/share/icons/hicolor/86x86/apps/
icon.files = harbour-sailsoma.png

INSTALLS += target icon desktop qml
