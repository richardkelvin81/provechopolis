

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provechopolis/LOGIC/entities/video.dart';

import '../../LOGIC/datasources/video_datasource.dart';

class VideoDataSourceImpl extends VideoDataSource{
   static final _firestoreVideosCollection =
      FirebaseFirestore.instance.collection('videos');

  @override
  Future<Video> createVideo(Map<String, dynamic> videoLike) {
    // TODO: implement createVideo
    throw UnimplementedError();
  }

  @override
  Future<List<Video>> filterVideosByTerm(Map<String, dynamic> term) {
    // TODO: implement filterVideosByTerm
    throw UnimplementedError();
  }

  @override
  Future<Video> getVideoById(String id) {
    // TODO: implement getVideoById
    throw UnimplementedError();
  }

  @override
  Future<List<Video>> getVideosByPage({int limit = 5, int offset = 0, String lastId = ''}) {
    // TODO: implement getVideosByPage
    throw UnimplementedError();
  }

  @override
  Future<List<Video>> searchVideosByTerm(String term) {
    // TODO: implement searchVideosByTerm
    throw UnimplementedError();
  }

  @override
  Future<Video> updateVideo(Map<String, dynamic> videoLike) {
    // TODO: implement updateVideo
    throw UnimplementedError();
  }

 


}