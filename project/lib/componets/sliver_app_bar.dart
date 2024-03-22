import 'package:flutter/material.dart';
import 'package:project/componets/filter.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({super.key,
  required this.child,
  required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      collapsedHeight: 120,
      floating: false,
      pinned :true,
      actions:[
        IconButton(onPressed: (){
                      _showFilterDrawer(context);

        },
        
         icon: const Icon(Icons.filter),
         ),
      ],

      title: const Text("vehicle"),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title:title,
      ),
    );
  }
}
 void _showFilterDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return const FilterDrawer();
      },
    );
  }
