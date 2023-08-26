


import 'package:provechopolis/LOGIC/entities/video.dart';

import '../../LOGIC/datasources/video_datasource.dart';
import '../../LOGIC/repositories/video_repository.dart';
import '../datasources/video_datasource_impl.dart';

class VideoRepositoryImpl extends VideoRepository{
 final VideoDataSource dataSource;

  VideoRepositoryImpl({
    VideoDataSource? dataSource
  }) : dataSource = dataSource ?? VideoDataSourceImpl();

  @override
  Future<Video> createVideo(Map<String, dynamic> videoLike) {
    return dataSource.createVideo(videoLike);
  }

  @override
  Future<List<Video>> filterVideosByTerm(Map<String, dynamic> term) {
   
   return dataSource.filterVideosByTerm(term);
  }

  @override
  Future<Video> getVideoById(String id) {
   return dataSource.getVideoById(id);
  }

  @override
  Future<List<Video>> getVideosByPage({int limit = 5, int offset = 0, String lastId = ''}) {
  return dataSource.getVideosByPage(limit:limit,offset: offset, lastId: lastId);
  }

  @override
  Future<List<Video>> searchVideosByTerm(String term) {
  return dataSource.searchVideosByTerm(term);
  }

  @override
  Future<Video> updateVideo(Map<String, dynamic> videoLike) {
  
    return dataSource.updateVideo(videoLike);
  }

 
  
}