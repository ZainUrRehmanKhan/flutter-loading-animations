import 'dart:ui';
import 'package:flutter/material.dart';

class ThreeDots extends StatefulWidget {
  final Duration duration;
  final double size;
  final List<Color> colors;

  ThreeDots({
    this.duration = const Duration(milliseconds: 1000),
    @required this.size,
    @required this.colors,
  });

  @override
  _ThreeDotsState createState() => _ThreeDotsState();
}

class _ThreeDotsState extends State<ThreeDots> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> _dots1Animation;
  Animation<Alignment> _dots2Animation;
  Animation<Alignment> _dots3Animation;

  int index = 0;

  _animate() async {
    await _controller.forward();
    _controller.reset();

    setState(() {
      if (index == widget.colors.length - 1)
        index = 0;
      else
        ++index;
    });

    _animate();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animate();
  }

  @override
  Widget build(BuildContext context) {
    _dots1Animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: Alignment(-1, 0), end: Alignment(-1, -1)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment(-1, -1), end: Alignment(-1, 0)),
        weight: 1,
      )
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.0, 0.7, curve: Curves.easeOut),
          parent: _controller),
    );

    _dots2Animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: Alignment(-1, 0), end: Alignment(-1, -1)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment(-1, -1), end: Alignment(-1, 0)),
        weight: 1,
      )
    ]).animate(
      CurvedAnimation(
        curve: Interval(0.1, 0.8, curve: Curves.easeOut),
        parent: _controller,
      ),
    );

    _dots3Animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: Alignment(-1, 0), end: Alignment(-1, -1)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment(-1, -1), end: Alignment(-1, 0)),
        weight: 1,
      )
    ]).animate(
      CurvedAnimation(
        curve: Interval(0.2, 1.0, curve: Curves.easeOut),
        parent: _controller,
      ),
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: Container(
            height: widget.size,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dot(dotsAnimation: _dots1Animation),
                dot(dotsAnimation: _dots2Animation),
                dot(dotsAnimation: _dots3Animation),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget dot({Animation<Alignment> dotsAnimation}) {
    return Align(
      alignment: dotsAnimation.value,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.size * 0.05),
        child: AnimatedContainer(
          duration: widget.duration,
          height: widget.size * 0.3,
          width: widget.size * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.colors[index],
          ),
        ),
      ),
    );
  }
}
