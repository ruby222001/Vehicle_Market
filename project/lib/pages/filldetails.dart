import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/pages/home_page.dart';

class FillDetails extends StatefulWidget {
  FillDetails({Key? key}) : super(key: key);

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  final titleController = TextEditingController();
  var pickedImage;

  List<String> categoriesList = ['One', 'Two', 'Three', 'Four'];
  List<String> brandList = ['Maruti', 'Toyota', 'Rover', 'laborginni', 'audi'];

  String? dropdownValue;
  String? brandValue;
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera),
                    label: Text("Camera"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery
                      );
                    },
                    icon: Icon(Icons.image),
                    label: Text("Gallery"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                    label: Text("Cancel"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  pickImage(ImageSource imageType) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final photo = await _picker.pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        this.pickedImage = tempImage;
      });
      Get.back();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A D D'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Category dropdown
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                isExpanded: true,
                underline: const SizedBox(), // Remove the underline
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: categoriesList.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),

            const Text(
              'Select Brand',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Brand dropdown
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: brandValue,
                isExpanded: true,
                underline: const SizedBox(), // Remove the underline
                onChanged: (String? newValue) {
                  setState(() {
                    brandValue = newValue;
                  });
                },
                items: brandList.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
            ),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const Text('Image'),
            Container(
              height: 100,
              width: 100,
              child:pickedImage != null
                  ? Image.file(
                pickedImage!,
                fit: BoxFit.cover,
              )
                  : Image.network(
                'https://static.thenounproject.com/png/2413564-200.png',
                fit: BoxFit.cover,
              ),
            ),
            ElevatedButton.icon(
              onPressed:imagePickerOption,
                label: Text('add Image'),
              icon: Icon(Icons.image),
            ),
            ElevatedButton(
              onPressed: () {
                // Check if both dropdowns are selected
                if (dropdownValue == null || brandValue == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please select both Category and Brand.'),
                  ));
                  return;
                }

                // Save data to Firestore
                CollectionReference collRef = FirebaseFirestore.instance.collection('Product');
                collRef.add({
                  'category': dropdownValue,
                  'brand': brandValue,
                  'description': titleController.text,
                }).then((value) {
                  print('Data added to Firestore with ID: ${value.id}');
                  
                  // Navigate to the home page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Replace HomePage with your actual home page
                  );
                }).catchError((error) {
                  print('Failed to add data to Firestore: $error');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Failed to save data. Please try again.'),
                  ));
                });
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
