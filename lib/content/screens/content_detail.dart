import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/widgets/content_app_bar.dart';
import 'package:progra3_proyecto_final/content/widgets/content_category.dart';
import 'package:progra3_proyecto_final/content/widgets/content_date.dart';
import 'package:progra3_proyecto_final/content/widgets/content_genre.dart';
import 'package:progra3_proyecto_final/content/widgets/content_sumary.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentDetail extends StatefulWidget {
  final String title;
  final String sumary;
  final String date;
  final String videoId;
  final String categoria;
  final String genero;
  ContentDetail(
  {
    Key key,
    this.title,
    this.sumary,
    this.date,
    this.videoId,
    this.categoria,
    this.genero
   }
      );

  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          ContentAppBar(title: widget.title,),
          Container(
            margin: EdgeInsets.only(top: 120),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: widget.videoId, //Add videoID.
                flags: YoutubePlayerFlags(
                  hideControls: false,
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.green,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF0A1149),
            ),
            margin: EdgeInsets.only(top: 350),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          ContentCategory(category: widget.categoria,),
                          ContentGenre(genre: widget.genero,)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                      child: ContentSumary(sumary: widget.sumary),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                      child: ContentDate(date: widget.date,),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
