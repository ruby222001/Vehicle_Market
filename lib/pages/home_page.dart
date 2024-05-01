import 'package:flutter/material.dart';
import 'package:project/components/background_image.dart';
import 'package:project/components/bottom_navigator_bar.dart';
import 'package:project/components/drawer.dart';
import 'package:project/components/filter.dart';
import 'package:project/components/floatingactionbutton.dart';
import 'package:project/components/searchfield.dart';
import 'package:project/pages/filtered_results.dart';
import 'package:project/pages/single_detail_page.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic>? uploadedDetails;

  const HomePage({
    Key? key,
    this.uploadedDetails,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void searchVehicles(String query) {}
  void _showFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: SizedBox.expand(
          child: FilterDrawer(
            onApplyFilters: (filters) {},
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(
          onSignout: () {},
        ),
        backgroundColor: Colors.transparent,
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
                  title: const Text(
                    'Mobile Garage',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        _showFilterDrawer(context);
                      },
                      icon: const Icon(
                        Icons.filter,
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
                SearchBox(
                  onChanged: searchVehicles,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOP SERVICES',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text('View all'),
                                  Icon(Icons.arrow_forward),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: const CircularFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
