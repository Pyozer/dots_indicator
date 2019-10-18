import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _totalDots = 5;
  double _currentPosition = 0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  Widget _buildRow(List<Widget> widgets) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    const decorator = DotsDecorator(
      activeColor: Colors.red,
      activeSize: Size.square(50.0),
      activeShape: RoundedRectangleBorder(),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dots indicator example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Current position ${(_currentPosition + 1)} / $_totalDots',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              _buildRow([
                Slider(
                  value: _currentPosition,
                  max: (_totalDots - 1).toDouble(),
                  onChanged: _updatePosition,
                )
              ]),
              _buildRow([
                FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () => _updatePosition(max(--_currentPosition, 0)),
                ),
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => _updatePosition(
                      min(++_currentPosition, _totalDots.toDouble())),
                )
              ]),
              _buildRow([
                Text('Vertical'),
                Text('Vertical reversed'),
              ]),
              _buildRow([
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  axis: Axis.vertical,
                  decorator: decorator,
                ),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  axis: Axis.vertical,
                  reversed: true,
                  decorator: decorator,
                ),
              ]),
              _buildRow([
                Text('Horizontal'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  decorator: decorator,
                ),
              ]),
              _buildRow([
                Text('Horizontal reversed'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  reversed: true,
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
