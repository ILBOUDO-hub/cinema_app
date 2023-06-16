import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final imagePath,
      assetPath2,
      author,
      price,
      title,
      description,
      urlvideo,
      categorie;

  VideoPlayerScreen(
      {this.imagePath,
      this.assetPath2,
      this.author,
      this.price,
      this.title,
      this.description,
      this.urlvideo,
      this.categorie
      //this.isFavorite
      });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  IconData _playPauseIcon = Icons.play_arrow;
  Duration _currentPosition = Duration.zero;
  Duration _videoDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Remplacez l'URL de la vidéo par votre propre URL ou chemin local de la vidéo
    _controller = VideoPlayerController.asset(widget.urlvideo)
      ..initialize().then((_) {
        setState(() {
          _videoDuration = _controller.value.duration;
        });
      });

    _controller.addListener(() {
      setState(() {
        _currentPosition = _controller.value.position;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _playPauseVideo() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
        _playPauseIcon = Icons.play_arrow;
      } else {
        _controller.play();
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
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                });
                _isPlaying ? _controller.play() : _controller.pause();
              },
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(_controller),
                  ),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: _isPlaying ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 300),
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
            Row(
              children: [
                Text(
                  '${_currentPosition.inMinutes}:${(_currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Colors.red,
                      bufferedColor: Colors.grey,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Text(
                  '${_videoDuration.inMinutes}:${(_videoDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
            /*Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Description de la vidéo',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 10.0),
                  /*Row(
                    children: [
                      Text(
                        '${_currentPosition.inMinutes}:${(_currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '${_videoDuration.inMinutes}:${(_videoDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),*/
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
