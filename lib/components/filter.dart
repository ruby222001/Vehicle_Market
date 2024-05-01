import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  final Function(FilterOptions) onApplyFilters;

  const FilterDrawer({Key? key, required this.onApplyFilters}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  String selectedCondition = 'Used';
  String selectedcategory = 'Two-Wheeler';
  RangeValues values = const RangeValues(100000, 100000); 
  List<String> conditionDrop = ['other', 'Brand New', 'Used'];
  List<String> categoryDrop = ['Two-Wheeler', 'Four-Wheeler'];

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());

    return Drawer(
      child: Padding(
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
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: selectedCondition,
                isExpanded: true,
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCondition = newValue!;
                  });
                },
                items: conditionDrop.map<DropdownMenuItem<String>>(
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
            const Text('Category'),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: selectedcategory,
                isExpanded: true,
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedcategory = newValue!;
                  });
                },
                items: categoryDrop.map<DropdownMenuItem<String>>(
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
            const SizedBox(height: 20.0),
            const Text('Price'),
            RangeSlider(
              values: values,
              labels: labels,
              min: 0,
              max: 200000,
              divisions: 1000,
              onChanged: (newValue) {
                setState(() {
                  values = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                final filters = FilterOptions(
                  selectedCondition: selectedCondition,
                  selectedcategory: selectedcategory,
                );
                widget.onApplyFilters(filters);
                Navigator.pop(context);
              },
              child: const Text("Apply Filters"),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOptions {
  final String selectedCondition;
  final String selectedcategory;

  FilterOptions({
    required this.selectedCondition,
    required this.selectedcategory,
  });
}
