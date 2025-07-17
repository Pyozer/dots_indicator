import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0.0;
    if (position < 0.0) return _totalDots - 1;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  String getPrettyCurrPosition() {
    return (_currentPosition + 1).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final decorator = DotsDecorator(
      activeColor: Colors.red,
      size: Size.square(15.0),
      activeSize: Size.square(35.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );

    const titleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dots indicator example'),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildRow([
                Text(
                  'Current position ${getPrettyCurrPosition()} / $_totalDots',
                  style: titleStyle,
                ),
              ]),
              _buildRow([
                SizedBox(
                  width: 300.0,
                  child: Slider(
                    value: _currentPosition,
                    max: (_totalDots - 1).toDouble(),
                    onChanged: _updatePosition,
                  ),
                ),
              ]),
              _buildRow([
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    _currentPosition = _currentPosition.ceilToDouble();
                    _updatePosition(max(--_currentPosition, 0.0));
                  },
                ),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    _currentPosition = _currentPosition.floorToDouble();
                    _updatePosition(min(
                      ++_currentPosition,
                      _totalDots.toDouble(),
                    ));
                  },
                )
              ]),
              _buildRow([
                Column(
                  children: [
                    const Text('Vertical', style: titleStyle),
                    const SizedBox(height: 16.0),
                    DotsIndicator(
                      dotsCount: _totalDots,
                      position: _currentPosition,
                      axis: Axis.vertical,
                      decorator: decorator,
                      onTap: (pos) {
                        setState(() => _currentPosition = pos.toDouble());
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Vertical reversed', style: titleStyle),
                    const SizedBox(height: 16.0),
                    DotsIndicator(
                      dotsCount: _totalDots,
                      position: _currentPosition,
                      axis: Axis.vertical,
                      reversed: true,
                      decorator: decorator,
                    ),
                  ],
                ),
              ]),
              _buildRow([
                const Text('Horizontal', style: titleStyle),
              ]),
              _buildRow([
                const Text('Individual custom dot'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  decorator: DotsDecorator(
                    colors: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.cyan,
                    ].reversed.toList(),
                    activeColors: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.cyan,
                    ],
                    sizes: [
                      Size.square(40.0),
                      Size.square(35.0),
                      Size.square(30.0),
                      Size.square(25.0),
                      Size.square(20.0),
                    ],
                    activeSizes: [
                      Size.square(20.0),
                      Size.square(25.0),
                      Size.square(30.0),
                      Size.square(35.0),
                      Size.square(40.0),
                    ],
                    shapes: [
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                    ],
                    activeShapes: [
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                    ],
                  ),
                ),
              ]),
              _buildRow([
                const Text('Reversed'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  reversed: true,
                  decorator: decorator,
                ),
              ]),
              _buildRow([
                const Text('Indefinite Pager Indicator'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  decorator: decorator,
                  fadeOutLastDot: true,
                  fadeOutDistance: 2,
                  animate: true,
                ),
              ]),
              _buildRow([
                const Text('Active Previous Dot'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  activePreviousDot: true,
                  decorator: decorator,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
