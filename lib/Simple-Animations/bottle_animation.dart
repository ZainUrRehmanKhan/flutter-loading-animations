import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class BottleAnimation extends StatefulWidget {
  final Duration duration;
  final double size;
  final Color color;

  BottleAnimation(
      {this.duration = const Duration(milliseconds: 3000),
      @required this.size,
      this.color});

  @override
  _BottleAnimationState createState() => _BottleAnimationState();
}

class _BottleAnimationState extends State<BottleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotationAnimation;
  var angle = Random().nextInt(360).toDouble();
  bool flag = true;
  String statusText = 'Tap bottle to play!';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
  }

  onClick() {
    if(flag){
      angle = Random().nextInt(360).toDouble();
      changeStatus('wait...');
      setState(() {});

      _controller.forward().then((value) => {
        flag = false,
        changeStatus('Reset to play again!')
      });
    }
  }

  reset() {
    flag = true;
    _controller.reset();
    changeStatus('Tap to play again!');
    setState(() {});
  }

  changeStatus(String status){
    setState(() {
      statusText = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    _rotationAnimation = Tween(begin: 0.0, end: (angle + 360) * 4).animate(
        CurvedAnimation(
            curve: Interval(0.0, 1.0, curve: Curves.ease),
            parent: _controller));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widget.size,
            height: widget.size,
            child: Stack(
              children: [
                Container(
                  height: widget.size,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/circle_background.png'),
                          fit: BoxFit.cover,
                          alignment: Alignment.center),
                    shape: BoxShape.circle
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          onClick();
                        },
                        child: Transform.rotate(
                          angle: _rotationAnimation.value * 0.0174533,
                          child: Container(
                            height: widget.size / 2.5,
                            width: widget.size / 2.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/bottle.png'),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center)),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              child: Text('Reset'),
              onPressed: reset,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(statusText),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
