import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/filldetails.dart';
import 'package:project/pages/marketplace.dart';
import 'package:project/pages/my_vehicles.dart';


const double buttonSize = 50;

class CircularFab extends StatefulWidget {
  const CircularFab({Key? key}) : super(key: key);

  @override
  State<CircularFab> createState() => _CircularFabState();
}

class _CircularFabState extends State<CircularFab>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Flow(
        delegate: FlowMenuDelegate(controller: controller),
        children: <IconData>[
          Icons.list,
          Icons.home,
          Icons.call,
          Icons.search,
        ].map<Widget>(buildFAB).toList(),
      );

  Widget buildFAB(IconData icon) => SizedBox(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }

            switch (icon) {
              case Icons.list:
                Get.to(const MyVehicles());
                break;
              case Icons.home:
                Get.to(const MarketPlace());
                break;
              case Icons.call:
                Get.to(const FillDetails());
                break;
            }
          },
          elevation: 0,
          splashColor: Colors.black,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final n = context.childCount;
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setvalue = (value) => isLastItem ? 0.0 : value;
      final radius = 100 * controller.value;
      final theta = i * pi * 0.5 / (n - 2);
      final x = xStart - setvalue(radius * cos(theta));
      final y = yStart - setvalue(radius * sin(theta));
      context.paintChild(i, transform: Matrix4.identity()..translate(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
