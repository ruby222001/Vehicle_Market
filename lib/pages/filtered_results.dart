import 'package:flutter/material.dart';
import 'package:project/pages/single_detail_page.dart';

class FilteredResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> filteredList;

  const FilteredResultsPage({Key? key, required this.filteredList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Results'),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> item = filteredList[index];
          String category = item["category"];
          String brand = item["brand"];
          String condition = item["condition"];
          String description = item["description"];
          String color = item["color"];
          String price = item["price"];
          String location = item["Address"];
          String imageUrl = item["imageUrl"];

          return Material(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SinglePage(
                    category: category,
                    brand: brand,
                    condition: condition,
                    description: description,
                    price: price,
                    color: color,
                    location: location,
                    imageUrl: imageUrl,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(description),
                            Text("Rs. $price | $condition"),
                            Text(location),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
