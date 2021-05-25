import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Demo6 extends StatefulWidget {
  final Duration duration;
  final double size;
  final Color color;

  Demo6({this.duration = const Duration(milliseconds: 1000), @required this.size, this.color});

  @override
  _Demo6State createState() => _Demo6State();
}

class _Demo6State extends State<Demo6> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this)..repeat();
  }

  @override
  Widget build(BuildContext context) {
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: widget.size + (widget.size * 0.1)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: widget.size + (widget.size * 0.1), end: widget.size),
          weight: 0.2)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.0, 0.7, curve: Curves.linear),
          parent: _controller),
    );

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: _scaleAnimation.value,
                    width: _scaleAnimation.value,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: (widget.size / 8) * _controller.value,
                            color: widget.color
                        )
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: widget.size,
                    width: widget.size,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: widget.size / 8,
                            color: widget.color
                        )
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
