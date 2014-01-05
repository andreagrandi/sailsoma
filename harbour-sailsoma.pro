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
    rpm/harbour-sailsoma.spec \
    qml/pages/SailSoma.qml \
    qml/pages/About.qml \
    rpm/harbour-sailsoma.yaml \
    LICENSE

QT += multimedia \
    xml

CONFIG += sailfishapp
