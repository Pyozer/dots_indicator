library dots_indicator;

import 'package:dots_indicator/src/dots_decorator.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int position;
  final DotsDecorator decorator;

  DotsIndicator({
    Key key,
    @required this.dotsCount,
    this.position = 0,
    this.decorator = const DotsDecorator(),
  })  : assert(dotsCount != null && dotsCount > 0),
        assert(position != null && position >= 0),
        assert(decorator != null),
        assert(
          position < dotsCount,
          "Position must be inferior than dotsCount",
        ),
        super(key: key);

  Widget _buildDot(int i) {
    final color = (i == position) ? decorator.activeColor : decorator.color;
    final size = (i == position) ? decorator.activeSize : decorator.size;
    final shape = (i == position) ? decorator.activeShape : decorator.shape;

    return Container(
      width: size.width,
      height: size.height,
      margin: decorator.spacing,
      decoration: ShapeDecoration(color: color, shape: shape),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(dotsCount, _buildDot),
    );
  }
}
