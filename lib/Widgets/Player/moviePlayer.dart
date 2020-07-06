import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterLearning/Widgets/Movies/movies.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  final Movie movie;
  MoviePlayer({this.movie});

  @override
  _MoviePlayerState createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  VideoPlayerController _controller;
  ChewieController _chewieController;
  //double _aspectRatio = 16 / 9;


  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(widget.movie.url);

    //add chwie controls.
      _chewieController = ChewieController(
        allowedScreenSleep: false,
        allowFullScreen: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
        videoPlayerController: _controller,
        //aspectRatio: _aspectRatio,
        autoInitialize: true,
        autoPlay: true,
        showControls: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text('Error while loading movie'),
          );
        },
      );

      // add chwie orientation change listners
      _chewieController.addListener(() {
        if (_chewieController.isFullScreen) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ]);
        } else {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        }
      });
    //_initializeVideoPlayerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    _chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.name),
        ),
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: Container(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}
