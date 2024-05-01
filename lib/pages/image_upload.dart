import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/pages/home_page.dart';

class ImageUploader extends StatefulWidget {
  final String description;
  final String category;
  final String brand;
  final String condition;
  final String price;
  final String color;
  final String location;

  const ImageUploader({
    Key? key,
    required this.description,
    required this.category,
    required this.brand,
    required this.condition,
    required this.price,
    required this.color,
    required this.location,
  }) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  final ImagePicker _imagePicker = ImagePicker();
  late File _imageFile;
  bool _uploading = false;

  @override
  void initState() {
    super.initState();
    _imageFile = File(''); 
  }

  void _selectImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  void _uploadImageAndSaveData() {
    setState(() {
      _uploading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      String imageUrl = 'https://via.placeholder.com/200'; 

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => HomePage(
            uploadedDetails: {
              'description': widget.description,
              'category': widget.category,
              'brand': widget.brand,
              'condition': widget.condition,
              'price': widget.price,
              'color': widget.color,
              'location': widget.location,
              'imageUrl': _imageFile.path, 
            },
          ),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile.path.isNotEmpty
                ? Image.file(
                    _imageFile,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : const Text('No image selected'),
            ElevatedButton(
              onPressed: _selectImage,
              child: const Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: _uploading ? null : _uploadImageAndSaveData,
              child: _uploading
                  ? const CircularProgressIndicator()
                  : const Text('Upload Image and Save'),
            ),
          ],
        ),
      ),
    );
  }
}