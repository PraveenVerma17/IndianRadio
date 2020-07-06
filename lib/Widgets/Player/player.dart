import 'package:flutter/material.dart';
import 'package:flutterLearning/Widgets/AppBar/appheader.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutterLearning/Widgets/Stations/station.dart';

class Player extends StatefulWidget {
  final Station station;
  Player({this.station});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayerState _audioState = AudioPlayerState.STOPPED;
  bool _muted = false;

  @override
  void dispose() {
    //_audioPlayer.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    play();
  }

  void stop() {
    _audioPlayer.stop();
    setState(() {
      _audioState = AudioPlayerState.STOPPED;
    });
  }

  void play() {
    _audioPlayer.play(widget.station.url);
    setState(() {
      _audioState = AudioPlayerState.PLAYING;
    });
  }

  void pause() {
    _audioPlayer.pause();
    setState(() {
      _audioState = AudioPlayerState.PAUSED;
    });
  }

  void togglemute() {
    setState(() {
      _muted = !_muted;
    });
    _audioPlayer.mute(_muted);
  }

  void handlePlayChange() {
    _audioState == AudioPlayerState.PLAYING ? pause() : play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppHeader(
          title: 'Player',
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Image.network(
              widget.station.image,
              height: 400,
              width: double.infinity,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                _audioState == AudioPlayerState.PLAYING
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                size: 60,
              ),
              onPressed: handlePlayChange,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(_muted ? Icons.volume_off : Icons.volume_up, size: 60),
              onPressed: togglemute,
            ),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
