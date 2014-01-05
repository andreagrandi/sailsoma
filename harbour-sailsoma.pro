# The name of your app
TARGET = harbour-sailsoma

# C++ sources
SOURCES += main.cpp \
    servercomm.cpp \
    playlistreader.cpp

# C++ headers
HEADERS += servercomm.h \
    playlistreader.h

OTHER_FILES = \
    qml/main.qml \
    qml/pages/SailSoma.qml \
    qml/pages/About.qml \
    qml/pages/ChannelPlayer.qml \
    qml/pages/ChannelsDelegate.qml \
    qml/pages/ChannelsModel.qml \
    qml/pages/images/SailSoma_500x500.png \
    qml/cover/CoverPage.qml \
    qml/cover/sailsoma.png \
    rpm/harbour-sailsoma.spec \
    rpm/harbour-sailsoma.yaml \
    LICENSE \
    harbour-sailsoma.desktop

QT += multimedia xml

CONFIG += sailfishapp
