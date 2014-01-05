# The name of your app
TARGET = harbour-sailsoma

CONFIG += sailfishapp

# C++ sources
SOURCES += main.cpp \
    servercomm.cpp \
    playlistreader.cpp

# C++ headers
HEADERS += servercomm.h \
    playlistreader.h

INCLUDEPATH += $$PWD

# The .desktop file
#desktop.files = harbour-sailsoma.desktop
#desktop.path = /usr/share/applications

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

QT += multimedia xml quick qml

icon.path = /usr/share/icons/hicolor/86x86/apps/
icon.files = harbour-sailsoma.png

#TARGETPATH = /usr/bin
#target.path = $$TARGETPATH
#DEPLOYMENT_PATH = /usr/share/$$TARGET
#INSTALLS += icon target desktop
