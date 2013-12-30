#include "servercomm.h"
#include "playlistreader.h"
#include <QDebug>
#include <QUrl>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QMediaPlaylist>
#include <QTimer>
#include <QDomDocument>

ServerComm::ServerComm(QObject *parent) :
    QObject(parent)
{
    playlistNetworkReader = new QNetworkAccessManager(this);
    connect(playlistNetworkReader, SIGNAL(finished(QNetworkReply*)), this, SLOT(finishLoadingChannel(QNetworkReply*)));

    channelInfoReader = new QNetworkAccessManager(this);
    connect(channelInfoReader, SIGNAL(finished(QNetworkReply*)), this, SLOT(finishReadingChannelInfo(QNetworkReply*)));

    player = new QMediaPlayer(this);
    mediaplaylist = new QMediaPlaylist;
    player->setPlaylist(mediaplaylist);

    connect(player, SIGNAL(mediaStatusChanged(QMediaPlayer::MediaStatus)), this, SLOT(setMediaStatus(QMediaPlayer::MediaStatus)));
    connect(player, SIGNAL(positionChanged(qint64)), this, SLOT(updateProgress(qint64)));

    connect(player, SIGNAL(stateChanged(QMediaPlayer::State)), this, SLOT(playerState(QMediaPlayer::State)));

    nowPlayingSongTimer = new QTimer(this);
    connect(nowPlayingSongTimer, SIGNAL(timeout()), this, SLOT(checkSongUpdates()));
}

void ServerComm::play()
{
    player->play();
    songPlaying();
}

void ServerComm::pause()
{
    player->pause();
    songPaused();
}

void ServerComm::loadChannel(QString channelUrl)
{
    channelLoading();
    playlistNetworkReader->get(QNetworkRequest(channelUrl));
}

void ServerComm::finishLoadingChannel(QNetworkReply *reply)
{
    QByteArray playlistData = reply->readAll();
    PlaylistReader playlistReader(playlistData);
    PlaylistReader::StreamUrls streamUrls = playlistReader.getStreamUrls();

    QString streamUrl = streamUrls[0];
    mediaplaylist->clear();
    mediaplaylist->addMedia(QUrl(streamUrl));

    player->play();
    songPlaying();
}

void ServerComm::updateProgress(qint64 time)
{
    int minutes = 0;
    int seconds = 0;

    minutes = (time / 1000) / 60;
    seconds = (time / 1000) % 60;

    QString min_str = QString("%1").arg(minutes, 2, 10, QLatin1Char('0'));
    QString sec_str = QString("%1").arg(seconds, 2, 10, QLatin1Char('0'));

    positionUpdate(min_str, sec_str);
}

void ServerComm::setMediaStatus(QMediaPlayer::MediaStatus state)
{
    switch (state) {
    case QMediaPlayer::LoadedMedia:
    case QMediaPlayer::BufferedMedia:
        emit channelLoaded();
        break;
    case QMediaPlayer::StalledMedia:
    case QMediaPlayer::BufferingMedia:
    case QMediaPlayer::LoadingMedia:
        emit channelLoading();
        break;
    default:
        break;
    }
}

void ServerComm::checkSongUpdates()
{
    updateSong();
}

void ServerComm::playerState(QMediaPlayer::State state)
{
    switch (state)
    {
        case QMediaPlayer::StoppedState:
            nowPlayingSongTimer->stop();
            break;
        case QMediaPlayer::PlayingState:
            nowPlayingSongTimer->start(SONGS_POLL_TIME);
            break;
        case QMediaPlayer::PausedState:
            nowPlayingSongTimer->stop();
            break;
    }
}

void ServerComm::updateChannelInfo(QString channelId)
{
    QNetworkRequest request = QNetworkRequest(QUrl(CHANNEL_REFRESH_URL));
    request.setAttribute(QNetworkRequest::User, QVariant(channelId));
    channelInfoReader->get(request);
}

void ServerComm::finishReadingChannelInfo(QNetworkReply *reply)
{
    QString channelId = reply->request().attribute(QNetworkRequest::User).toString();
    QString lastPlaying = "";

    QByteArray data = reply->readAll();
    QString xmldata = QString::fromUtf8(data);

    QDomDocument doc("Channels");
    doc.setContent(xmldata.toUtf8());

    QDomNodeList channels = doc.documentElement().elementsByTagName("channels").at(1).toElement().elementsByTagName("channel");

    for(int i = 0; i < channels.count(); i++)
    {
        if(channels.at(i).toElement().attribute("id") == channelId)
            lastPlaying = channels.at(i).toElement().elementsByTagName("lastPlaying").at(0).toElement().text();
    }

    channelSongUpdate(lastPlaying);
}
