import 'package:loading_animation/Simple-Animations/spinning_square.dart';
import 'package:loading_animation/Simple-Animations/circular_spiral.dart';
import 'package:loading_animation/Simple-Animations/barcode_loader.dart';
import 'package:loading_animation/Simple-Animations/fancy_plus.dart';
import 'package:loading_animation/Simple-Animations/three_dots.dart';
import 'package:flutter/material.dart';

import 'Simple-Animations/circular_pulse.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  child: FancyPlus(
                      color: Colors.brown,
                      size: 50,
                      lineHeight: 15,
                      lineWidth: 3),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Fancy Plus')
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: BarcodeLoader(height: 50, color: Colors.lightBlue),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Barcode Loader')
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: CircularSpiral(
                    ///
                    /// TODO Solve Size Issue
                    ///
                    size: 20,
                    color: Colors.blueGrey,
                    type: CircularSpiralType.simple,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Circular Spiral Double')
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: CircularSpiral(
                    size: 50,
                    color: Colors.blueGrey,
                    type: CircularSpiralType.heavy,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Circular Spiral Triple')
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: ThreeDots(
                    size: 50,
                    colors: [Colors.blue, Colors.red, Colors.yellow],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Three Dots')
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: CircularPulse(
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Circular Pulse')
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  child: SpinningSquare(size: 50, color: Colors.lightGreenAccent,),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Spinning Square')
              ],
            ),
          ],
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
