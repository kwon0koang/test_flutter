import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';

@RoutePage()
class TestBlocPage extends StatelessWidget {
  const TestBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutWidget(
      title: '',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '0',
              style: TextStyle(fontSize: 20, color: Colors.deepOrange),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('+'),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {},
              child: const Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
