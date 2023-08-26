import 'package:provechopolis/VIEW/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String description;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name, 
    required this.description,
    required this.videoUrl, 
    this.likes = 0, 
    this.views = 0, 
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => 
    LocalVideoModel(
      name: json['name'] ?? 'Aquí está tu solicitud', 
      description: json['description'] ?? 'Reacciona a este short',
      videoUrl: json['videoUrl'],
      likes: json['likes'] ?? 0, 
      views:  json['views'] ?? 0, 
    );

    VideoPost toVideoPostEntity() => VideoPost(
      caption: name,
      description: description,
      videoUrl: videoUrl,
      likes: likes,
      views: views
      );
}

/* Nota: VideoPost tiene un dato con nombre diferente a local video model, porque será */