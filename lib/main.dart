import 'package:animation_learn/widget/blackhole_animation.dart';
import 'package:animation_learn/widget/chang_color.dart';
import 'package:animation_learn/widget/circle_animation.dart';
import 'package:animation_learn/widget/drawer_Widget.dart';
import 'package:animation_learn/widget/rotation_box_widget.dart';
import 'package:animation_learn/widget/slidetransition_box_widget.dart';
import 'package:animation_learn/widget/transform_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const CardHiddenAnimationPage(),
      );
}

// class MainPage extends StatefulWidget {
//   const MainPage({
//     super.key,
//   });
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         drawer: const DrawerWidget(),
//         appBar: AppBar(
//           title: Text('Animation'),
//         ),
//         body: const Center(child: Text('Welcome to the Animation App')),
//       );
// }
