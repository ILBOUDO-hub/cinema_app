import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class PlayerDetail extends StatefulWidget {
  @override
    late final assetPath1,
      assetPath2,
      cookieauteur,
      cookieprice,
      cookiename,
      cookiecategorie;
        PlayerDetail({
    this.assetPath1,
    this.assetPath2,
    this.cookieauteur,
    this.cookieprice,
    this.cookiename,
    this.cookiecategorie,
    //this.isFavorite
  });
  _PlayerDetailState createState() => _PlayerDetailState();

}

class _PlayerDetailState extends State<PlayerDetail> with SingleTickerProviderStateMixin {
 
//class PlayerDetail extends StatelessWidget {

  //  isFavorite;
  final _controller = PageController();



  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;

  late VideoPlayerController videocontroller;

  @override
  void initState() {
    super.initState();
    videocontroller = VideoPlayerController.asset("assets/moali.mp4")
      ..initialize().then((_) {
        setState(() {});
        //videocontroller.play();
        videocontroller.setLooping(false);
        videocontroller.setVolume(1.0);
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Trailer",
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
        ),
        body: Column(
          children: [
            Padding(//Code 
              padding: EdgeInsets.only(top: 2),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: videocontroller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: videocontroller.value.aspectRatio,
                        child: VideoPlayer(videocontroller),
                      )
                    : Container(),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(//Code pour le button play et pause
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Icon(
                      videocontroller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow_sharp,
                      size: 50,
                    ),
                    onPressed: () {
                      videocontroller.value.isPlaying
                          ? videocontroller.pause()
                          : videocontroller.play();
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
