import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  final Duration duration;
  final double height;
  final Color color;

  Demo2({this.duration = const Duration(milliseconds: 1000), @required this.height, @required this.color});

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleContainer1Animation;
  Animation<double> _scaleContainer2Animation;
  Animation<double> _scaleContainer3Animation;
  Animation<double> _scaleContainer4Animation;
  Animation<double> _scaleContainer5Animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    _scaleContainer1Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.0, 0.5, curve: Curves.easeOut),
          parent: _controller),
    );
    _scaleContainer2Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.1, 0.6, curve: Curves.easeOut),
          parent: _controller),
    );
    _scaleContainer3Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.2, 0.7, curve: Curves.easeOut),
          parent: _controller),
    );
    _scaleContainer4Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.3, 0.8, curve: Curves.easeOut),
          parent: _controller),
    );
    _scaleContainer5Animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.4, 0.9, curve: Curves.easeOut),
          parent: _controller),
    );

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customContainer(scaleAnimation: _scaleContainer1Animation),
              customContainer(scaleAnimation: _scaleContainer2Animation),
              customContainer(scaleAnimation: _scaleContainer3Animation),
              customContainer(scaleAnimation: _scaleContainer4Animation),
              customContainer(scaleAnimation: _scaleContainer5Animation)
            ],
          ));
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget customContainer({Animation<double> scaleAnimation}) {
    return Padding(
      padding: EdgeInsets.only(right: (widget.height * 0.2) / 2),
      child: Container(
        color: widget.color,
        height: widget.height * scaleAnimation.value,
        width: widget.height * 0.3,
      ),
    );
  }
}
