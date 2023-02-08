import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/global.dart';
import 'package:videoplayer/main.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class videoscreen extends StatefulWidget {
  const videoscreen({Key? key}) : super(key: key);

  @override
  State<videoscreen> createState() => _videoscreenState();
}

class _videoscreenState extends State<videoscreen> {
  //String url = '';
  String url = '${Global.vidurl}';
  late VideoPlayerController videoPlayerController;
   late ChewieController chewieController;
  loadvideo() async {
    videoPlayerController =
        VideoPlayerController.asset("${url}");

    await videoPlayerController.initialize();

    setState(() {});

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
    autoPlay: true,
      allowFullScreen: true
        
      //autoInitialize: true,
    );
  }

  @override
  void initState() {
    loadvideo();
    super.initState();
  }
  @override
  void dispose()
  {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: AspectRatio(
         aspectRatio: videoPlayerController.value.aspectRatio,
         child: Chewie(controller: chewieController),
       ),
      ),
    );
  }
}
