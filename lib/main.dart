import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer/screen.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'global.dart';
void normal()
{

}
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: videoplay(),
  ));
}

class videoplay extends StatefulWidget {
  const videoplay({Key? key}) : super(key: key);

  @override
  State<videoplay> createState() => _videoplayState();
}

class _videoplayState extends State<videoplay> {

bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cheap YouTube',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
       actions: [

        ],
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
       body:Container(
         child: Container(
           alignment: Alignment.center,
           color: Colors.black26,
           child: ListView(
               children: Global.videos
                   .map(
                     (e) => Container(
                   //color: Colors.white54,
                   height: 150,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       ListTile(
                         onTap: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => videoscreen()));
                           setState(() {
                             Global.vidurl = '${e['videoYT']}';
                             print("${Global.vidurl}");
                           });
                         },
                         visualDensity: VisualDensity(vertical: 4),
                         leading: Image.network(
                           '${e['image']}',
                         ),
                         title: Text('${e['title']}'),
                         subtitle: Text('${e['ID']}'),
                       ),
                       Container(
                         margin: EdgeInsets.all(5),
                       ),
                       Text(
                         '${e['description']}',
                         style: TextStyle(
                             fontSize: 10, fontWeight: FontWeight.w200),
                       )
                     ],
                   ),
                   decoration: BoxDecoration(
                     border: Border(
                       //top: BorderSide(width: 1.0, color: Colors.black),
                       bottom: BorderSide(width: 1.0, color: Colors.black),
                     ),
                     color: Colors.white,
                   ),
                 ),
               )
                   .toList()),
         ),
       ),
    );
  }
}

