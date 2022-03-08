import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final Widget? testBody;

  const TestScreen({Key? key, this.testBody}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.testBody == null ? _testBtn : null,
      body: widget.testBody ?? _testText,
    );
  }

  FloatingActionButton get _testBtn => FloatingActionButton(
        key: const ValueKey('testButton'),
        onPressed: () => setState(() => _index++),
      );
  Text get _testText => Text(
        _index.toString(),
        key: const ValueKey('testText'),
      );
}
