#include "playlistreader.h"

#include <QStringList>
#include <QRegExp>

PlaylistReader::PlaylistReader(const QString &playlistContents) :
    contents(playlistContents)
{
}

PlaylistReader::StreamUrls PlaylistReader::getStreamUrls()
{
    StreamUrls urls;
    QRegExp streamRegExp("(File\\d)=(.*)");

    QStringList lines = contents.split("\n");

    for (QStringList::const_iterator line = lines.begin(); line != lines.end(); ++line)
    {
        if (line->startsWith("File")) {
            if (streamRegExp.indexIn(*line) != -1)
            {
                QString url = streamRegExp.cap(2);
                urls << url;
            }
        }
    }

    return urls;
}

