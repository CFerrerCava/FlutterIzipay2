import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget button;
  final VoidCallback onPress;
  BouncingButton({this.button, this.onPress}) : super();
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (widget.onPress != null) {
          _controller.forward();
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (widget.onPress != null) {
          _controller.reverse();
          widget.onPress();
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.button,
      ),
    );
    // return Container(
    //   child: GestureDetector(
    //     onTapDown: _tapDown,
    //     onTapUp: _tapUp,
    //     child: Transform.scale(
    //       scale: _scale,
    //       child: widget.button,
    //     ),
    //   ),
    // );
  }
}
