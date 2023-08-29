import 'package:animation_learn/main.dart';
import 'package:animation_learn/widget/blackhole_animation.dart';
import 'package:animation_learn/widget/chang_color.dart';
import 'package:animation_learn/widget/rotation_box_widget.dart';
import 'package:animation_learn/widget/transform_box_widget.dart';
import 'package:flutter/material.dart';

import 'circle_animation.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => MainPage(),
            //           ));
            //     },
            //     child: const Text('Main Page')),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardHiddenAnimationPage(),
                    ));
              },
              child: const Text('Black hole animation'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ColorChange(),
                    ));
              },
              child: const Text('Color Change Animation'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CircleAnimation(),
                    ));
              },
              child: const Text('Circle Animation'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RotationBoxWidget(),
                    ));
              },
              child: const Text('Rotation Box Animation'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransformBoxWidget(),
                    ));
              },
              child: const Text('Transform Bon Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
