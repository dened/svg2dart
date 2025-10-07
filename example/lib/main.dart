import 'package:example/generated/icons/gradient.gen.dart';
import 'package:example/generated/icons/mask.gen.dart';
import 'package:example/generated/icons/text.gen.dart';
import 'package:example/generated/icons/fire.gen.dart';
import 'package:example/generated/icons/gift.gen.dart';
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
const dimesion = 48.0;

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
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          /// Support gradient
          SvgPicture.asset(
            'assets/svg/gradient.svg',
            width: dimesion,
            height: dimesion,
          ),
          GradientSvg(),

          /// Support text
          SvgPicture.asset(
            'assets/svg/text.svg',
            width: dimesion,
            height: dimesion,
          ),
          TextSvg(),

          /// Complex SVG
          SvgPicture.asset('assets/svg/fire.svg'),
          FireSvg(),

          /// Color filter
          SvgPicture.asset('assets/svg/gift.svg', colorFilter: colorFilter),
          GiftSvg(colorFilter: colorFilter),

          /// Support musks
          SvgPicture.asset(
            'assets/svg/mask.svg',
            width: dimesion,
            height: dimesion,
          ),
          MaskSvg(),
        ],
      ),
    );
  }
}
