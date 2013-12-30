#ifndef PLAYLISTREADER_H
#define PLAYLISTREADER_H

#include <QString>
#include <QList>

class PlaylistReader
{
    QString contents;

public:
    PlaylistReader(const QString &playlistContents);
    typedef QList<QString> StreamUrls;
    StreamUrls getStreamUrls();
};

#endif // PLAYLISTREADER_H
