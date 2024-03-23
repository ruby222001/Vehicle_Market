import 'package:flutter/material.dart';
import 'package:project/components/filter.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final void Function(FilterOptions) onApplyFilters;

  const MySliverAppBar({
    Key? key,
    required this.child,
    required this.title,
    required this.onApplyFilters,
  }) : super(key: key);

  void _showFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return FilterDrawer(
          onApplyFilters: (filters) {
            onApplyFilters(filters);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            _showFilterDrawer(context);
          },
          icon: const Icon(Icons.filter),
        ),
      ],
      title: const Text("vehicle"),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
      ),
    );
  }
}
