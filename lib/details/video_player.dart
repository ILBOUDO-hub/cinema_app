import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VideoPlayerScreen extends StatefulWidget {
  final imagePath,
      assetPath2,
      room,
      price,
      title,
      description,
      urlvideo,
      categorie;

  VideoPlayerScreen({
    this.imagePath,
    this.assetPath2,
    this.room,
    this.price,
    this.title,
    this.description,
    this.urlvideo,
    this.categorie,
    //this.isFavorite
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  bool _isPlaying = false;
  IconData _playPauseIcon = Icons.play_arrow;
  Duration _currentPosition = Duration.zero;
  Duration _videoDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.urlvideo);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
    );

    _videoPlayerController.addListener(() {
      setState(() {
        _currentPosition = _videoPlayerController.value.position;
      });
    });

    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoDuration = _videoPlayerController.value.duration;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  void _playPauseVideo() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _isPlaying = false;
        _playPauseIcon = Icons.play_arrow;
      } else {
        _videoPlayerController.play();
        _isPlaying = true;
        _playPauseIcon = Icons.pause;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _playPauseVideo,
              child: Stack(
                children: [
                  Container(
                      height: 500,
                      width: double.infinity,
                      child: Chewie(controller: _chewieController)),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: _isPlaying ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          _playPauseIcon,
                          size: 80.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
