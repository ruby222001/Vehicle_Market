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
            Text(
              'Brand: ${vehicle.brand}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Year: ${vehicle.vdate}'),
            Text('Price: \$${vehicle.price}'),
            Text('Condition: ${vehicle.condition}'),
            Text('Negotiable: ${vehicle.negotiable}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}