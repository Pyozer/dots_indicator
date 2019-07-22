import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _totalDots = 6;
  int _currentPosition = 0;

  int _validPosition(int position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1;
    return position;
  }

  void _updatePosition(int position) {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dots indicator example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Current position: ${(_currentPosition + 1)} / $_totalDots'),
              _buildRow([
                FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () => _updatePosition(--_currentPosition),
                ),
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => _updatePosition(++_currentPosition),
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
                ),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  axis: Axis.vertical,
                  reversed: true,
                ),
              ]),
              _buildRow([
                Text('Horizontal'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                ),
              ]),
              _buildRow([
                Text('Horizontal reversed'),
                DotsIndicator(
                  dotsCount: _totalDots,
                  position: _currentPosition,
                  reversed: true,
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
