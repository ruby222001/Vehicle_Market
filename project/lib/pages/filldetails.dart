import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/image_upload.dart';

class FillDetails extends StatefulWidget {
  FillDetails({Key? key}) : super(key: key);

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  final titleController = TextEditingController();

  List<String> categoriesList = ['One', 'Two', 'Three', 'Four'];
  List<String> brandList = ['Maruti', 'Toyota', 'Rover', 'laborginni', 'audi'];

  String? dropdownValue;
  String? brandValue;
void _saveDataAndNavigate() async {
  // Check if both dropdowns are selected
  if (dropdownValue == null || brandValue == null) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Please select both Category and Brand.'),
    ));
    return;
  }

  try {
    // Save data to Firestore
    print('Saving data to Firestore...');
    await FirebaseFirestore.instance.collection('details').add({
      'category': dropdownValue,
      'brand': brandValue,
      'description': titleController.text,
    });

    print('Data saved to Firestore successfully.');

    // Navigate to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImageUp()),
    );
  } catch (e) {
    print('Error saving data to Firestore: $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Failed to save data. Please try again.'),
    ));
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Category dropdown
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                underline: SizedBox(), // Remove the underline
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

            Text(
              'Select Brand',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Brand dropdown
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                underline: SizedBox(), // Remove the underline
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

            Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
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
            ElevatedButton(
              onPressed: _saveDataAndNavigate,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
