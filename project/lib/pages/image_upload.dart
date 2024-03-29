import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/filldetails.dart';

class ImageUp extends StatefulWidget {
  const ImageUp({Key? key}) : super(key: key);

  @override
  State<ImageUp> createState() => _ImageUpState();
}

class _ImageUpState extends State<ImageUp> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  String? imageUrl;

  Future<void> uploadFile() async {
    if (pickedFile == null) return;

    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('link: $urlDownload');
    setState(() {
      imageUrl = urlDownload;
      uploadTask = null;
    });
    
  }

  Future<void> selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageUrl != null)
            Expanded(
              child: Container(
                color: Colors.blue[100],
                child: Image.network(imageUrl!),
              ),
            ),
          if (pickedFile != null)
            Expanded(
              child: Container(
                color: Colors.blue[100],
                height: 5,
                child: Center(
                  child: Text(pickedFile!.name),
                  
                ),
              ),
            ),
          Row(
            children: [
              ElevatedButton(
                onPressed: selectFile,
                child: const Text('Select File'),
              ),
              ElevatedButton(
                onPressed: uploadFile,
                child: const Text('Upload File'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>  FillDetails())),
            child: const Text('Next'),
          ),
          buildProgress(),
        ],
      ),
    );
  }

  Widget buildProgress() => uploadTask != null
      ? StreamBuilder<TaskSnapshot>(
          stream: uploadTask!.snapshotEvents,
          builder: (context, snapshot) {
            final data = snapshot.data;
            final double? progress =
                data != null ? data.bytesTransferred / data.totalBytes : null;

            return progress != null
                ? SizedBox(
                    height: 50,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey,
                          color: Colors.green,
                        ),
                        Center(
                          child: Text(
                            '${(progress * 100).round()}%',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(height: 50);
          },
        )
      : const SizedBox(height: 50);
}

