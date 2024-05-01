import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/pages/image_upload.dart';

// FillDetails Widget
class FillDetails extends StatefulWidget {
  const FillDetails({Key? key}) : super(key: key);

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  final descriptioncontroller = TextEditingController();
  final kilometerrancontroller = TextEditingController();
  final colorcontroller = TextEditingController();
  final locationcontroller = TextEditingController();
  final pricecontroller = TextEditingController();

  List<String> categoriesList = ['Two-Wheeler', 'Four-Wheeler'];
  List<String> brandListTwoWheeler = [
    'Bajaj',
    'TVS',
    'Yamaha',
    'Honda',
    'Suzuki',
    'KTM'
  ];
  List<String> brandListFourWheeler = [
    'Mahindra',
    'Kia',
    'Toyota',
    'Hyundai',
    'Maruti Suzuki'
  ];
  List<String> conditionList = ['Used', 'Brand New', 'Other'];

  String? categoryValue;
  String? brandValue;
  String? conditionValue;
  bool agreed = false;
  bool negotiable = false;
  bool fixedPrice = false;

  void _saveDetailsAndNavigate(BuildContext context) {
    // Save the details entered by the user
    String description = descriptioncontroller.text;
    String category = categoryValue!;
    String brand = brandValue!;
    String condition = conditionValue!;
    String price = pricecontroller.text;
    String color = colorcontroller.text;
    String location = locationcontroller.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageUploader(
          description: description,
          category: category,
          brand: brand,
          condition: condition,
          price: price,
          color: color,
          location: location,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(),
            Column(
              children: [
                AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text(
                    'Vehicle Ecommerce app',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category dropdown
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            border: Border.all(
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<String>(
                            value: categoryValue,
                            isExpanded: true,
                            hint: const Text(
                              'Category',
                            ),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                categoryValue = newValue;
                                brandValue = null;
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

                        if (categoryValue == 'Two-Wheeler')
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton<String>(
                              value: brandValue,
                              hint: const Text(
                                'Brand',
                              ),
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  brandValue = newValue;
                                });
                              },
                              items: brandListTwoWheeler
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),

                        if (categoryValue == 'Four-Wheeler')
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton<String>(
                              value: brandValue,
                              hint: const Text('Brand'),
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  brandValue = newValue;
                                });
                              },
                              items: brandListFourWheeler
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),

                        // Condition dropdown
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<String>(
                            value: conditionValue,
                            isExpanded: true,
                            hint: const Text(
                              'Condition',
                            ),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              setState(() {
                                conditionValue = newValue;
                              });
                            },
                            items: conditionList.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextField(
                                    controller: pricecontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Rs. Price',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextField(
                                    controller: kilometerrancontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Kilometer Run',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextField(
                                    controller: colorcontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Color',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextField(
                                    controller: locationcontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Made Year',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: descriptioncontroller,
                              decoration: InputDecoration(
                                hintText: 'Description',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: negotiable,
                                  onChanged: (value) {
                                    setState(() {
                                      negotiable = value as bool;
                                      fixedPrice = !value;
                                    });
                                  },
                                ),
                                const Text(
                                  'Negotiable',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: fixedPrice,
                                  onChanged: (value) {
                                    setState(() {
                                      fixedPrice = value as bool;
                                      negotiable = !value;
                                    });
                                  },
                                ),
                                const Text(
                                  'Fixed Price',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(
                              value: agreed,
                              onChanged: (bool? value) {
                                setState(() {
                                  agreed = value!;
                                });
                              },
                            ),
                            const Text(
                              'I agree to the terms and condition',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if (agreed) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageUploader(
                                    description: descriptioncontroller.text,
                                    category: categoryValue!,
                                    brand: brandValue!,
                                    condition: conditionValue!,
                                    price: pricecontroller.text,
                                    color: colorcontroller.text,
                                    location: locationcontroller.text,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please agree to terms and conditions.'),
                                ),
                              );
                            }
                          },
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
