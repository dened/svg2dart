import 'package:example/generated/icons/circle.dart';
import 'package:example/generated/icons/cloud.dart';
import 'package:example/generated/icons/fire.dart';
import 'package:example/generated/icons/gift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final colorFilter = ColorFilter.mode(Colors.yellow, BlendMode.srcIn);
const dimesion = 96.0;

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/svg/circle.svg',
                    width: dimesion,
                    height: dimesion,
                  ),
                ),
                Expanded(
                  child: Circle(width: dimesion, height: dimesion),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/svg/circle.svg',
                    colorFilter: colorFilter,
                  ),
                ),
                Expanded(child: Circle(colorFilter: colorFilter)),
              ],
            ),
            Row(
              children: [
                Expanded(child: SvgPicture.asset('assets/svg/cloud.svg')),
                Expanded(child: Cloud()),
              ],
            ),
            Row(
              children: [
                Expanded(child: SvgPicture.asset('assets/svg/fire.svg')),
                Expanded(child: Fire()),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/svg/fire.svg',
                    width: dimesion,
                    height: dimesion,
                  ),
                ),
                Expanded(
                  child: Fire(width: dimesion, height: dimesion),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: SvgPicture.asset('assets/svg/gift.svg')),
                Expanded(child: Gift()),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/svg/gift.svg',
                    colorFilter: colorFilter,
                  ),
                ),
                Expanded(child: Gift(colorFilter: colorFilter)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
