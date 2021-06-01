import 'package:loading_animation/Simple-Animations/future_dots.dart';
import 'package:loading_animation/Simple-Animations/spinning_square.dart';
import 'package:loading_animation/Simple-Animations/circular_spiral.dart';
import 'package:loading_animation/Simple-Animations/barcode_loader.dart';
import 'package:loading_animation/Simple-Animations/fancy_plus.dart';
import 'package:loading_animation/Simple-Animations/three_dots.dart';
import 'Simple-Animations/circular_pulse.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView(
          children: [
            customCard(
                FancyPlus(
                  color: Colors.brown,
                  size: 40,
                  lineHeight: 15,
                  lineWidth: 3,
                ),
                'Fancy Plus'),
            customCard(
                BarcodeLoader(
                  height: 30,
                  color: Colors.lightBlue,
                ),
                'Barcode Loader'),
            customCard(
                CircularSpiral(
                  size: 40,
                  color: Colors.blueGrey,
                  type: CircularSpiralType.simple,
                ),
                'Circular Spiral Double'),
            customCard(
                CircularSpiral(
                  size: 40,
                  color: Colors.blueGrey,
                  type: CircularSpiralType.heavy,
                ),
                'Circular Spiral Triple'),
            customCard(
                ThreeDots(
                  size: 40,
                  colors: [Colors.blue, Colors.red, Colors.yellow],
                ),
                'Three Dots'),
            customCard(
                CircularPulse(
                  size: 40,
                  color: Colors.grey,
                ),
                'Circular Pulse'),
            customCard(
                SpinningSquare(
                  size: 40,
                  color: Colors.lightBlueAccent,
                ),
                'Spinning Square'),
            customCard(
              FutureDots(
                duration: Duration(milliseconds: 1000),
                size: 50,
                loadingColorDark: Colors.blueGrey,
                loadingColorLight: Colors.lightBlue,
                afterLoadingColorDark: Colors.blueGrey,
                afterLoadingColorLight: Colors.lightBlue,
                future: Future.delayed(
                  Duration(milliseconds: 5000),
                ),
              ),
              'Future Dots',
            )
          ],
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget customCard(Widget child, String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                )
              ]),
          height: 100,
          child: child,
        ),
        SizedBox(
          height: 15,
        ),
        Text(name),
      ],
    );
  }
}
