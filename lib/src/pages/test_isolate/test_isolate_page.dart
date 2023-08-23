import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// @RoutePage()
// class TestIsolatePage extends HookConsumerWidget {
//   const TestIsolatePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final countProvider = ref.watch(countForTestIsolateProvider);
//     final countNotifier = ref.read(countForTestIsolateProvider.notifier);

//     // _initIsolate();

//     return DefaultLayoutWidget(
//       title: '',
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '$countProvider',
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.deepOrange,
//               ),
//             ),
//             gapH10,
//             ElevatedButton(
//               onPressed: () {
//                 countNotifier.increment();
//               },
//               child: const Text('+'),
//             ),
//             gapH10,
//             ElevatedButton(
//               onPressed: () {
//                 countNotifier.decrement();
//               },
//               child: const Text('-'),
//             ),
//             gapH50,
//             ElevatedButton(
//               onPressed: () {
//                 final value = _sum(9999999);
//                 Log.d('value = $value');
//               },
//               child: const Text('Exec heavy func'),
//             ),
//             gapH10,
//             ElevatedButton(
//               onPressed: () async {
//                 compute(
//                   _sum,
//                   9999999,
//                 ).then(
//                   (value) => Log.d('value = $value'),
//                 );
//               },
//               child: const Text('Exec heavy func with isolate'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

BigInt _sum(int end) {
  BigInt result = BigInt.zero;
  for (int i = 0; i < end; i++) {
    result += BigInt.from(i);
  }
  return result;
}

@RoutePage()
class TestIsolatePage extends StatefulWidget {
  const TestIsolatePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestIsolatePage> {
  int _input = 10;
  int _result = 1;
  bool _calculating = false;

  void _calculateFactorial() async {
    setState(() {
      _calculating = true;
    });

    int result = await compute(factorial, _input);

    setState(() {
      _result = result;
      _calculating = false;
    });
  }

  // This is the heavy computation function that will be executed in a separate isolate.
  static int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * factorial(n - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compute Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter a number to calculate its factorial:'),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _input = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _calculating ? null : _calculateFactorial,
              child: const Text('Calculate Factorial'),
            ),
            const SizedBox(height: 20),
            _calculating
                ? const CircularProgressIndicator()
                : Text('Factorial of $_input is $_result'),
          ],
        ),
      ),
    );
  }
}
