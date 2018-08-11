import 'package:test/test.dart';

import 'package:dots_indicator/dots_indicator.dart';

void main() {
  test('Create a dot indicator with 5 dots', () {
    final dotsIndicator = new DotsIndicator(numberOfDot: 5);
    expect(dotsIndicator.numberOfDot, 5);
    expect(dotsIndicator.position, 0);
  });

  test('Create a dot indicator with 3 dots and positioned on second dot', () {
    final dotsIndicator = new DotsIndicator(numberOfDot: 3, position: 1);
    expect(dotsIndicator.numberOfDot, 3);
    expect(dotsIndicator.position, 1);
  });
}
