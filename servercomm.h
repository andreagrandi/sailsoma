#ifndef SERVERCOMM_H
#define SERVERCOMM_H

#include <QObject>
#include <QString>
#include <QMediaPlayer>

class QNetworkAccessManager;
class QNetworkReply;
class QMediaPlaylist;
class QTimer;

#define SONGS_POLL_TIME 10000
#define CHANNEL_REFRESH_URL "http://somafm.com/refresh.xml"

class ServerComm : public QObject
{
    Q_OBJECT
public:
    explicit ServerComm(QObject *parent = 0);

private:
    QNetworkAccessManager *playlistNetworkReader;
    QNetworkAccessManager *channelInfoReader;
    QMediaPlayer *player;
    QMediaPlaylist *mediaplaylist;
    QTimer *nowPlayingSongTimer;
signals:
    void channelLoading();
    void channelLoaded();
    void positionUpdate(QString minutes, QString seconds);
    void updateSong();
    void channelSongUpdate(QString song);
    void songPlaying();
    void songPaused();
public slots:
    void play();
    void pause();
    void loadChannel(QString channelUrl);
    void updateChannelInfo(QString channelName);
private slots:
    void updateProgress(qint64 time);
protected slots:
    void finishLoadingChannel(QNetworkReply *reply);
    void finishReadingChannelInfo(QNetworkReply *reply);
    void setMediaStatus(QMediaPlayer::MediaStatus state);
    void checkSongUpdates();
    void playerState(QMediaPlayer::State state);
};

#endif // SERVERCOMM_H
