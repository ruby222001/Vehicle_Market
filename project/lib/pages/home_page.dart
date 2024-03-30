import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/filter.dart';
import 'package:project/components/like_button.dart';
import 'package:project/components/sliver_app_bar.dart';
import 'package:project/components/bottom_navigator_bar.dart';
import 'package:project/components/drawer.dart';

import 'package:project/components/searchfield.dart';
import 'package:project/models/productdetails.dart';
import 'package:project/pages/single_detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  List<Vehicle> vehicles = [
    Vehicle(
      image:"lib/images/image.png",
      brand: "Honda",
      vdate: 2020,
      condition: "Brand New",
      price: 6000.0,
      wheelerType: WheelerType.twoWheeler,
      negotiable: 'Yes',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Toyota",
      vdate: 2019,
      price: 25000.0,
      wheelerType: WheelerType.fourWheeler,
      condition: 'Used',
      negotiable: 'Fixed Price',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Suzuki",
      vdate: 2022,
      price: 8000.0,
      wheelerType: WheelerType.twoWheeler,
      condition: 'LikeNew',
      negotiable: 'Yes',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Ford",
      vdate: 2021,
      price: 35000.0,
      wheelerType: WheelerType.fourWheeler,
      condition: 'LikeNew',
      negotiable: 'Yes',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Kawasaki",
      vdate: 2018,
      price: 9000.0,
      wheelerType: WheelerType.twoWheeler,
      condition: 'Used',
      negotiable: 'Yes',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Chevrolet",
      vdate: 2020,
      price: 30000.0,
      wheelerType: WheelerType.fourWheeler,
      condition: 'Brand New',
      negotiable: 'Fixed Price',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Yamaha",
      vdate: 2017,
      price: 7000.0,
      wheelerType: WheelerType.twoWheeler,
      condition: 'Used',
      negotiable: 'Fixed Price',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Mercedes-Benz",
      vdate: 2019,
      price: 60000.0,
      wheelerType: WheelerType.fourWheeler,
      condition: 'Brand New',
      negotiable: 'Yes',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "Ducati",
      vdate: 2023,
      price: 12000.0,
      wheelerType: WheelerType.twoWheeler,
      condition: 'Used',
      negotiable: 'Yes',
    ),
    Vehicle(
            image:"lib/images/image.png",

      brand: "BMW",
      vdate: 2020,
      price: 45000.0,
      wheelerType: WheelerType.fourWheeler,
      condition: 'LikeNew',
      negotiable: 'Fixed Price',
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

bool isLiked = false;
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  List<Vehicle> displayedVehicles = [];

  @override
  void initState() {
    super.initState();
    // Initialize displayedVehicles with all vehicles initially
    displayedVehicles = List.from(widget.vehicles);
  }

  void applyFilters(FilterOptions filters) {
    setState(() {
      // Reset displayedVehicles to the original list
      displayedVehicles = List.from(widget.vehicles);

      // Apply filters
      if (!filters.showTwoWheeler) {
        displayedVehicles.removeWhere(
            (vehicle) => vehicle.wheelerType == WheelerType.twoWheeler);
      }

      if (!filters.showFourWheeler) {
        displayedVehicles.removeWhere(
            (vehicle) => vehicle.wheelerType == WheelerType.fourWheeler);
      }

      if (filters.selectedCondition != 'Any') {
        displayedVehicles.removeWhere(
            (vehicle) => vehicle.condition != filters.selectedCondition);
      }

      // Filter by selected negotiable
      if (filters.selectedNegotiable != 'Any') {
        displayedVehicles.removeWhere(
            (vehicle) => vehicle.negotiable != filters.selectedNegotiable);
      }
    });
  }
 void searchVehicles(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedVehicles = List.from(widget.vehicles);
      } else {
        displayedVehicles = widget.vehicles.where((vehicle) {
          return vehicle.brand.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onSignout: signOut,
      ),
      bottomNavigationBar: const BottomNavigator(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: const Text('Vehicles'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchBox(
                  onChanged: searchVehicles,
                ),
                const Text(
                  "Top Viewed",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 100,
                ),
              ],
            ),
            onApplyFilters: (filters) {
              applyFilters(filters);
            },
          ),
        ],
        body: Column(
          children: [
            /// Filter IconButton
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: ListView.builder(
                  itemCount: displayedVehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = displayedVehicles[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (SinglePage(
                                        vehicle: vehicle,
                                      ))),
                            );
                          },
                        
                          child: ListTile(
                            leading: Image.asset(vehicle.image),
                            title: Text(vehicle.brand),
                            subtitle: Text(
    'Year: ${vehicle.vdate}\nPrice: Rs ${vehicle.price}\nType: ${_getType(vehicle.wheelerType)}',
                            ),
                            trailing: LikeButton(isLiked: true, onTap: (){})
                            // You can add more widgets here to display additional info about the vehicle
                          ),
                          
                        ),
                      ),
                    );
                  },
                ),
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
