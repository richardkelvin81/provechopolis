

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';



class NewVideoScreen extends StatefulWidget {
  const NewVideoScreen({super.key});

  @override
  State<NewVideoScreen> createState() => _NewVideoScreenState();
}

class _NewVideoScreenState extends State<NewVideoScreen> {
    XFile? _videoFile;
    final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
    

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


          
      final compressedVideoPath = await VideoCompress.compressVideo(
      _videoFile!.path,
      quality: VideoQuality.DefaultQuality,
      deleteOrigin: false,
    );

     final outputVideoPath =
        _videoFile!.path.replaceAll('.mp4', '.webm');

  final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg ();

    _flutterFFmpeg.execute ("-i $compressedVideoPath -c:v libvpx-vp9 -b:v 0 -c:a libopus $outputVideoPath").then((rc) {

      if (rc==1){

        print('si comprimio');

         final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.webm');

         storageRef.putFile(File(compressedVideoPath!.file!.path)).then((p0) {

          print ('video subido');

         });


      }else{
        print('No pudo comprimir');
      }



    });
          

   
  
  
   

  //  await uploadTask.whenComplete(() {
  //    print('Video uploaded');
  //  });
  }

  Future<void> compressAndConvertToWebM(String inputPath, String outputPath) async {
  //  ffmpeg -i input_file.mp4 -c:v livpx -crf 10 -b:v 1M -c:a libvorbis output_file.webm
  final arguments = [
    '-i', inputPath,
    '-c:v', 'libvpx',
    '-crf', 10,
    '-b:v', '1M',
    '-c:a', 'libopus',
    outputPath
  ];

  int result = await _flutterFFmpeg.executeWithArguments(arguments);

  if (result == 0) {
    print('Compresión y conversión a WebM exitosas');
    
  } else {
    print('Error en la compresión y conversión a WebM');
  }
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
