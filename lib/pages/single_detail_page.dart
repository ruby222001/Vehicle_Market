import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/components/bottom_navigator_bar.dart';

class SinglePage extends StatelessWidget {
  final String category;
  final String brand;
  final String description;
  final String color;
  final String price;
  final String condition;
  final String location;
  final String imageUrl;

  const SinglePage({
    Key? key,
    required this.category,
    required this.brand,
    required this.description,
    required this.color,
    required this.price,
    required this.condition,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigator(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 231, 145, 246),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: imageUrl.isNotEmpty
                                ? Image.network(
                                    imageUrl,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'lib/images/placeholder_image.png',
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Positioned(
                            top: 0,
                            right: 20,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                        color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Add to Sell',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('lib/images/google.png'),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Brand: $brand',
                      ),
                      Text('Category: $category'),
                      Text('condition: $condition'),
                      Text('Description: $description'),
                      Text('Price: $price'),
                      Text('Color: $color'),
                      Text('location: $location'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
