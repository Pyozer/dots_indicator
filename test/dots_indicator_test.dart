import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('renders one dot per dotsCount', (tester) async {
    await tester.pumpWidget(wrap(DotsIndicator(dotsCount: 4, position: 0)));

    expect(find.byType(AnimatedContainer), findsNWidgets(4));
  });

  testWidgets('calling onTap reports the tapped dot index', (tester) async {
    int? tappedIndex;
    await tester.pumpWidget(
      wrap(
        DotsIndicator(
          dotsCount: 3,
          position: 0,
          onTap: (index) => tappedIndex = index,
        ),
      ),
    );

    await tester.tap(find.byType(InkWell).at(2));

    expect(tappedIndex, 2);
  });

  testWidgets('reversed flips the dots order', (tester) async {
    await tester.pumpWidget(
      wrap(DotsIndicator(dotsCount: 3, position: 0, reversed: true)),
    );

    final row = tester.widget<Row>(find.byType(Row));
    expect(row.children, hasLength(3));
  });

  test('throws when dotsCount is not positive', () {
    expect(
      () => DotsIndicator(dotsCount: 0, position: 0),
      throwsAssertionError,
    );
  });

  testWidgets('throws when colors length does not match dotsCount', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        DotsIndicator(
          dotsCount: 3,
          position: 0,
          decorator: const DotsDecorator(colors: [Colors.red, Colors.blue]),
        ),
      ),
    );

    expect(tester.takeException(), isAssertionError);
  });
}
