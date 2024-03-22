import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  bool _showTwoWheeler = true;
  bool _showFourWheeler = true;

  String selectedValue = 'Any';
  List<String> dropdownItems = ['Any', 'Brand New','Like New','Used'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Filter Options",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
         const Text('Condition'),
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey,  // Border color
      width: 1.0,          // Border width
    ),
    borderRadius: BorderRadius.circular(4.0),  // Border radius
  ),
  child: DropdownButton<String>(
    value: selectedValue,
    isExpanded: true,
    underline: const SizedBox(),  // Remove the underline
    onChanged: (String? newValue) {
      setState(() {
        selectedValue = newValue!;
      });
    },
    items: dropdownItems.map<DropdownMenuItem<String>>(
      (String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(value),
          ),
        );
      },
    ).toList(),
  ),
),
CheckboxListTile(
  title: const Text("Show Two Wheeler"),
  value: _showTwoWheeler,
  onChanged: (value) {
    setState(() {
      _showTwoWheeler = value ?? false;
    });
  },
),
CheckboxListTile(
  title: const Text("Show Four Wheeler"),
  value: _showFourWheeler,
  onChanged: (value) {
    setState(() {
      _showFourWheeler = value ?? false;
    });
  },
),
const SizedBox(height: 20.0),
ElevatedButton(
  onPressed: () {
    // Add your logic here to apply filters
  },
  child: const Text("Apply Filters"),
),

        ],
      ),
    );
  }
}
