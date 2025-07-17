library dots_indicator;

import 'dart:math';

import 'package:dots_indicator/src/dots_decorator.dart';
import 'package:flutter/material.dart';

typedef OnTap = void Function(int position);

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final double position;

  /// If true, the last dot will fade out when the position is at the last dot.
  final bool fadeOutLastDot;

  /// Distance from currently selected dot to the one that fades out.
  final int fadeOutDistance;
  final DotsDecorator decorator;
  final Axis axis;
  final bool reversed;
  final OnTap? onTap;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;

  /// If true, the dots will animate when the position changes.
  final bool animate;

  /// Duration of the animation when the position changes.
  final Duration animationDuration;

  final bool activePreviousDot;

  DotsIndicator({
    super.key,
    required this.dotsCount,
    this.position = 0.0,
    this.decorator = const DotsDecorator(),
    this.axis = Axis.horizontal,
    this.reversed = false,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.onTap,
    this.fadeOutLastDot = false,
    this.fadeOutDistance = 0,
    this.animate = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.activePreviousDot = false,
  })  : assert(dotsCount > 0, 'dotsCount must be superior to zero'),
        assert(position >= 0.0, 'position must be superior or equals to zero'),
        assert(
          position < dotsCount,
          "position must be less than dotsCount",
        ),
        assert(
          decorator.colors.isEmpty || decorator.colors.length == dotsCount,
          "colors param in decorator must empty or have same length as dotsCount parameter",
        ),
        assert(
          decorator.activeColors.isEmpty ||
              decorator.activeColors.length == dotsCount,
          "activeColors param in decorator must empty or have same length as dotsCount parameter",
        ),
        assert(
          decorator.sizes.isEmpty || decorator.sizes.length == dotsCount,
          "sizes param in decorator must empty or have same length as dotsCount parameter",
        ),
        assert(
          decorator.activeSizes.isEmpty ||
              decorator.activeSizes.length == dotsCount,
          "activeSizes param in decorator must empty or have same length as dotsCount parameter",
        ),
        assert(
          decorator.shapes.isEmpty || decorator.shapes.length == dotsCount,
          "shapes param in decorator must empty or have same length as dotsCount parameter",
        ),
        assert(
          decorator.activeShapes.isEmpty ||
              decorator.activeShapes.length == dotsCount,
          "activeShapes param in decorator must empty or have same length as dotsCount parameter",
        ),
        assert(
          fadeOutLastDot == false || fadeOutDistance > 0,
          "fadeOutDistace must be superior to zero when fadeOutLastDot is true",
        ),
        assert(
          fadeOutDistance < dotsCount,
          "fadeOutDistace must be inferior to dotsCount",
        );

  Widget _wrapInkwell(Widget dot, int index) {
    return InkWell(
      customBorder: position == index
          ? decorator.getActiveShape(index)
          : decorator.getShape(index),
      onTap: () => onTap!(index),
      child: dot,
    );
  }

  Widget _buildDot(BuildContext context, int index) {
    final double absPositionIndexRelation = (position - index).abs();
    final bool isCurrentlyVisible = absPositionIndexRelation <= fadeOutDistance;

    final double lerpValue = activePreviousDot && index <= position
        ? 0.0 // Set lerpValue to 0 for active state
        : min(1.0, absPositionIndexRelation).toDouble();

    Size size = Size.lerp(
      decorator.getActiveSize(index),
      decorator.getSize(index),
      lerpValue,
    )!;

    if (fadeOutLastDot && absPositionIndexRelation >= fadeOutDistance) {
      size = Size.lerp(
        decorator.getSize(index),
        decorator.getFadeOutSize(index),
        absPositionIndexRelation == fadeOutDistance ? 1 : 0.0,
      )!;
    }

    final dot = Container(
      height: fadeOutLastDot && isCurrentlyVisible
          ? max(
                max(decorator.getActiveSize(index).height,
                    decorator.getSize(index).height),
                decorator.getFadeOutSize(index).height,
              ) +
              (axis == Axis.horizontal
                  ? decorator.spacing.vertical
                  : decorator.spacing.horizontal)
          : null,
      child: Center(
        child: AnimatedOpacity(
          duration: animate ? animationDuration : Duration.zero,
          opacity:
              !fadeOutLastDot || absPositionIndexRelation <= fadeOutDistance
                  ? 1.0
                  : 0.0,
          child: AnimatedContainer(
            duration: animate ? animationDuration : Duration.zero,
            width: size.width,
            height: size.height,
            margin: fadeOutLastDot && !isCurrentlyVisible
                ? EdgeInsets.all(0)
                : decorator.spacing,
            decoration: ShapeDecoration(
              color: Color.lerp(
                decorator.getActiveColor(index) ??
                    Theme.of(context).primaryColor,
                decorator.getColor(index),
                lerpValue,
              ),
              shape: ShapeBorder.lerp(
                decorator.getActiveShape(index),
                decorator.getShape(index),
                lerpValue,
              )!,
              shadows: BoxShadow.lerpList(
                decorator.getActiveShadows(index),
                decorator.getShadows(index),
                lerpValue,
              ),
            ),
          ),
        ),
      ),
    );
    return onTap == null ? dot : _wrapInkwell(dot, index);
  }

  @override
  Widget build(BuildContext context) {
    final dotsList = List<Widget>.generate(
      dotsCount,
      (i) => _buildDot(context, i),
    );
    final dots = reversed ? dotsList.reversed.toList() : dotsList;

    return axis == Axis.vertical
        ? Column(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: dots,
          )
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: dots,
          );
  }
}
