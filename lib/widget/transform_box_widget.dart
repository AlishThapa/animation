import 'package:animation_learn/widget/drawer_Widget.dart';
import 'package:flutter/material.dart';

class TransformBoxWidget extends StatefulWidget {
  const TransformBoxWidget({super.key});

  @override
  State<TransformBoxWidget> createState() => _TransformBoxWidgetState();
}

class _TransformBoxWidgetState extends State<TransformBoxWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<BorderRadius?> radiusAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    sizeAnimation = Tween<double>(begin: 150, end: 250).animate(curvedAnimation);
    radiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(60),
      end: BorderRadius.circular(16),
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerWidget(),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: radiusAnimation.value,
            ),
            child: Image.asset('assets/image/nepal.png'),
          ),
        ),
      ),
    );
  }
}
