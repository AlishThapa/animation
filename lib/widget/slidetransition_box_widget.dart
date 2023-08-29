import 'dart:math';

import 'package:animation_learn/widget/drawer_Widget.dart';
import 'package:flutter/material.dart';

class SlideTransitionBoxWidget extends StatefulWidget {
  @override
  _SlideTransitionBoxWidgetState createState() =>
      _SlideTransitionBoxWidgetState();
}

class _SlideTransitionBoxWidgetState extends State<SlideTransitionBoxWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isFirst = true; // Add this line to track animation state

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );

    animation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(listenAnimation);

    controller.forward();
  }

  void listenAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animation.removeStatusListener(listenAnimation);
      if (isFirst) {
        isFirst = false;
        animation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        )..addStatusListener(listenAnimation);

        controller.reset();
        controller.forward();
      } else {
        isFirst = true;
        animation = Tween<double>(begin: -1, end: 0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        )..addStatusListener(listenAnimation);

        controller.reset();
        controller.forward();
      }
    }
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
        child: Container(color: Colors.blue, width: 250, height: 250),
        builder: (context, child) {
          final width = MediaQuery.of(context).size.width;
          final x = animation.value * width;

          return Transform(
            transform: Matrix4.translationValues(x, 0, 0),
            child: child,
          );
        },
      ),
    ),
  );
}
