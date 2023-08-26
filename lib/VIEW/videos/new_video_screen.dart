

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:video_player/video_player.dart';



class NewVideoScreen extends StatefulWidget {
  const NewVideoScreen({super.key});

  @override
  State<NewVideoScreen> createState() => _NewVideoScreenState();
}

class _NewVideoScreenState extends State<NewVideoScreen> {
    XFile? _videoFile;

  Future<void> _pickVideoFromCamera() async {
    XFile? pickedVideo = await ImagePicker.platform.getVideo(source: ImageSource.camera);
    setState(() {
      _videoFile = pickedVideo;
    });
  }

  Future<void> _pickVideoFromGallery() async {
    XFile? pickedVideo = await ImagePicker.platform.getVideo(source: ImageSource.gallery);
    setState(() {
      _videoFile = pickedVideo;
    });
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) {
      return;
    }

    final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.mp4');

    final firebase_storage.UploadTask uploadTask = storageRef.putFile(File(_videoFile!.path));

    await uploadTask.whenComplete(() {
      print('Video uploaded');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _videoFile != null
                ? VideoPlayerWidget(videoFile: File(_videoFile!.path))
                : Text('No video selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickVideoFromCamera,
              child: Text('Record Video'),
            ),
            ElevatedButton(
              onPressed: _pickVideoFromGallery,
              child: Text('Select Video from Gallery'),
            ),
            ElevatedButton(
              onPressed: _uploadVideo,
              child: Text('Upload Video to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final File videoFile;
 

  const VideoPlayerWidget({super.key, required this.videoFile});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: VideoPlayer(VideoPlayerController.file(videoFile)),
    );
  }
}
