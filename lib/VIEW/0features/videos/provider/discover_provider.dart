import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/VIEW/models/local_video_model.dart';
import 'package:provechopolis/SHARED/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier{

  // TODO: Repository, Datasource
  

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {

    await Future.delayed(Duration(seconds: 2));
    List<VideoPost> newVideos = videoPosts.map((video) => 
      LocalVideoModel.fromJson(video).toVideoPostEntity()).toList();

    videos.addAll( newVideos );
    initialLoading = false;
    /* TODO: Cargar Videos */

    notifyListeners();
  }  
}