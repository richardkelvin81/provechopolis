
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';

import '../../LOGIC/entities/video.dart';

class VideoMapper {
      final String id;
      final String uid;
      final String userpic;
      final String thumbnail;
      final String songname;
      final Timestamp fecharegistro;
      final String titulo;
      final String estado;
      final String url;
      final  int    views;
      final  int    likes;
      final  int    sharecount;
      final String comments;
      final String restaurant;
    

  VideoMapper({
      required this.id,
      required this.uid,
      required this.userpic,
      required this.songname,
      required this.fecharegistro,
      required this.titulo, 
      required this.estado, 
      required this.url, 
      required this.comments, 
      required this.thumbnail,
      required this.sharecount,
      required this.restaurant,
      this.views = 0,
      this.likes = 0,
      });


  static jsonToEntity( Map<String, dynamic>? json ) => Video(
      id:                 json?['id']?? '',
      uid:                  json?['uid']?? '',
      userpic:               json?['userpic']?? '',
      songname:              json?['songname']?? '',
      fecharegistro:        json?['fecharegistro']?? '',
      titulo:               json?['titulo']?? '',
      estado:               json?['estado']?? '',
      url:                  json?['url']?? '',
      comments:             json?['comments']?? '',
      thumbnail:             json?['thumbnail']?? '',
     
      restaurant:         json?['restaurant']?? '',
      views:              json?['views']?? 0,
      likes:              json?['likes']?? 0,
      sharecount:         json?['sharecount']?? 0,
      


    );

     Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "userpic": userpic,
        "songname": songname,
        "fecharegistro": fecharegistro,
        "titulo": titulo,
        "estado": estado,
        "url": url,
        "comments": comments,
        "thumbnail": thumbnail,
        "restaurant": restaurant,
        "views": views,
        "likes": likes,
        "sharecount": sharecount,
        
    };
 
 


}