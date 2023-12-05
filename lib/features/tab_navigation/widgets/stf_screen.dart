import 'package:flutter/material.dart';

class StfScreren extends StatefulWidget {
  const StfScreren({super.key});

  @override
  State<StfScreren> createState() => _StfScrerenState();
}

class _StfScrerenState extends State<StfScreren> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks = _clicks + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Im built!");
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$_clicks"),
            TextButton(
              onPressed: _increase,
              child: const Text('+'),
            ),
          ],
        ),
      ),
    );
  }
}
