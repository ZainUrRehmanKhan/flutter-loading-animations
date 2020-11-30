import 'dart:ui';

import 'package:flutter/material.dart';

class Demo4 extends StatefulWidget {
  final Duration duration;
  final double size;
  final Color loadingColorLight,
      loadingColorDark,
      afterLoadingColorLight,
      afterLoadingColorDark;
  final Future future;

  Demo4(
      {@required this.duration,
      @required this.size,
      @required this.loadingColorDark,
      @required this.loadingColorLight,
      @required this.afterLoadingColorDark,
      @required this.afterLoadingColorLight,
      @required this.future});

  @override
  _Demo4State createState() => _Demo4State();
}

class _Demo4State extends State<Demo4> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _doneController;
  Animation<Alignment> _dots1Animation;
  Animation<Alignment> _dots2Animation;
  Animation<Alignment> _dots3Animation;
  Animation<double> _scaleAnimation;

  bool isCompleted = false;

  animateDots() async {
    widget.future.then((value) {
      _controller.stop();
      _doneController.forward();
      setState(() {
        isCompleted = true;
      });
    });

    await _controller.forward();
    _controller.reset();

    if (!isCompleted) animateDots();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _doneController = AnimationController(duration: widget.duration, vsync: this);
    animateDots();
  }

  @override
  Widget build(BuildContext context) {
    _dots1Animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment(-1, 0), end: Alignment(-1, -1)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween(begin: Alignment(-1, -1), end: Alignment(-1, 0)),
          weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.0, 0.7, curve: Curves.easeOut),
          parent: _controller),
    );

    _dots2Animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment(-1, 0), end: Alignment(-1, -1)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween(begin: Alignment(-1, -1), end: Alignment(-1, 0)),
          weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.2, 0.8, curve: Curves.easeOut),
          parent: _controller),
    );

    _dots3Animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: Alignment(-1, 0), end: Alignment(-1, -1)),
          weight: 0.5),
      TweenSequenceItem(
          tween: Tween(begin: Alignment(-1, -1), end: Alignment(-1, 0)),
          weight: 0.5)
    ]).animate(
      CurvedAnimation(
          curve: Interval(0.35, 0.9, curve: Curves.easeOut),
          parent: _controller),
    );

    _scaleAnimation = Tween(
      end: 1.0,
      begin: 0.0
    ).animate(CurvedAnimation(curve: Curves.bounceOut, parent: _doneController));

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(children: [
            Opacity(
              opacity: .2,
              child: Center(
                child: Container(
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? widget.afterLoadingColorLight
                        : widget.loadingColorLight,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Center(
              child: isCompleted
                  ? ScaleTransition(
                scale: _scaleAnimation,
                    child: Container(
                        child: Icon(
                          Icons.done_rounded,
                          color: widget.afterLoadingColorDark,
                          size: widget.size / 2,
                        ),
                      ),
                  )
                  : Container(
                      height: widget.size / 3,
                      width: widget.size,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          dot(dotsAnimation: _dots1Animation),
                          dot(dotsAnimation: _dots2Animation),
                          dot(dotsAnimation: _dots3Animation),
                        ],
                      ),
                    ),
            )
          ]);
        });
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
        padding: EdgeInsets.symmetric(horizontal: widget.size * 0.025),
        child: Container(
          height: widget.size * 0.1,
          width: widget.size * 0.1,
          decoration: BoxDecoration(
              color: widget.loadingColorDark, shape: BoxShape.circle),
        ),
      ),
    );
  }
}