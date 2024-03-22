import 'package:flutter/material.dart';
import 'package:project/componets/bottom_navigator_bar.dart';
import 'package:project/componets/drawer.dart';
import 'package:project/componets/filter.dart';
import 'package:project/componets/sliver_app_bar.dart';
import 'package:project/componets/searchfield.dart';
import 'package:project/models/productdetails.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  List<Vehicle> vehicles = [
    Vehicle(
      brand: "Honda",
      vdate: 2020,
      price: 6000.0,
      wheelerType: WheelerType.twoWheeler,
    ),
    Vehicle(
      brand: "Toyota",
      vdate: 2019,
      price: 25000.0,
      wheelerType: WheelerType.fourWheeler,
    ),
    Vehicle(
      brand: "Suzuki",
      vdate: 2022,
      price: 8000.0,
      wheelerType: WheelerType.twoWheeler,
    ),
    Vehicle(
      brand: "Ford",
      vdate: 2021,
      price: 35000.0,
      wheelerType: WheelerType.fourWheeler,
    ),
    Vehicle(
      brand: "Kawasaki",
      vdate: 2018,
      price: 9000.0,
      wheelerType: WheelerType.twoWheeler,
    ),
    Vehicle(
      brand: "Chevrolet",
      vdate: 2020,
      price: 30000.0,
      wheelerType: WheelerType.fourWheeler,
    ),
    Vehicle(
      brand: "Yamaha",
      vdate: 2017,
      price: 7000.0,
      wheelerType: WheelerType.twoWheeler,
    ),
    Vehicle(
      brand: "Mercedes-Benz",
      vdate: 2019,
      price: 60000.0,
      wheelerType: WheelerType.fourWheeler,
    ),
    Vehicle(
      brand: "Ducati",
      vdate: 2023,
      price: 12000.0,
      wheelerType: WheelerType.twoWheeler,
    ),
    Vehicle(
      brand: "BMW",
      vdate: 2020,
      price: 45000.0,
      wheelerType: WheelerType.fourWheeler,
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openFilter(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_){
return const FilterDrawer();
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: const MyDrawer(),
    bottomNavigationBar: const BottomNavigator(),
    body: NestedScrollView(
      headerSliverBuilder: (context,innerBoxIsScrolled)=>[
      MySliverAppBar(
        title: const Text('title'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchBox(),
const Text("Top Viewed",
style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
),
),
Container(
  color: Colors.black,
  height:100,
),
        ],
      ),
      ),
    ], 
    body: Column(
        children: [

          /// Filter IconButton
          
          Expanded(
            child: ListView.builder(
              itemCount: widget.vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = widget.vehicles[index];
                return ListTile(
                  title: Text(vehicle.brand),
                  subtitle: Text(
                      'Year: ${vehicle.vdate}, Price: \$${vehicle.price}, Type: ${_getType(vehicle.wheelerType)}'),
                  // You can add more widgets here to display additional info about the vehicle
                );
              },
            ),
          ),
        ],
      ),
    ),
    );
  }

  String _getType(WheelerType type) {
    switch (type) {
      case WheelerType.twoWheeler:
        return "Two Wheeler";
      case WheelerType.fourWheeler:
        return "Four Wheeler";
    }
  }
}
