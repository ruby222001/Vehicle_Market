import 'package:flutter/material.dart';
import 'package:project/components/bottom_navigator_bar.dart';
import 'package:project/models/productdetails.dart';

class SinglePage extends StatelessWidget {
  final Vehicle vehicle;

  const SinglePage({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(vehicle.brand)),
      ),
                  bottomNavigationBar: const BottomNavigator(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(vehicle.image),
            const SizedBox(height: 10),
            Text('Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,

              ),
            ),
            Text(
              'Brand: ${vehicle.brand}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
              Text('Year: ${vehicle.vdate}'),
            Text('Price: Rs ${vehicle.price}'),
            Text('Condition: ${vehicle.condition}'),
            Text('Negotiable: ${vehicle.negotiable}'),


          ],
        ),
      ),
    );
  }
} 