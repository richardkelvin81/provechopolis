import '../entities/video.dart';

abstract class VideoDataSource {

  Future<List<Video>> getVideosByPage({ int limit = 5, int offset = 0, String lastId=''});
  Future<Video> getVideoById(String id);
  Future<List<Video>> searchVideosByTerm( String term );
  Future<List<Video>> filterVideosByTerm( Map<String,dynamic> term );
  Future<Video> createVideo( Map<String,dynamic> videoLike );
  Future<Video> updateVideo( Map<String,dynamic> videoLike );
 
}