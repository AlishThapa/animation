import 'dart:math';

import 'package:animation_learn/widget/drawer_Widget.dart';
import 'package:flutter/material.dart';

class RotationBoxWidget extends StatefulWidget {
  const RotationBoxWidget({super.key});

  @override
  _RotationBoxWidgetState createState() => _RotationBoxWidgetState();
}

class _RotationBoxWidgetState extends State<RotationBoxWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),

    drawer: const DrawerWidget(),
    body: Center(
          child: AnimatedBuilder(
            animation: animation,
            child: Container(color: Colors.red, width: 250, height: 250),
            builder: (context, child) => Transform.rotate(
              angle: animation.value,
              child: child,
            ),
          ),
        ),
  );
}
