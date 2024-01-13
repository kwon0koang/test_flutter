import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/pages/test_socket/test_tcpsocket_providers.dart';

@RoutePage()
class TestTcpSocketPage extends HookConsumerWidget {
  const TestTcpSocketPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayoutWidget(
      title: '',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _TcpRespWidget(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(tcpSocketProvider.notifier)
                    .write(msg: 'request_fast_number');
              },
              child: const Text('숫자 요청'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(tcpSocketProvider.notifier)
                    .write(msg: 'cancel_fast_number');
              },
              child: const Text('숫자 중지'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(tcpSocketProvider.notifier).close();
              },
              child: const Text('연결 종료'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(tcpSocketProvider.notifier).reconnect();
              },
              child: const Text('재연결'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TcpRespWidget extends HookConsumerWidget {
  const _TcpRespWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tcpSocketProvider);
    final resp = ref.watch(tcpRespProvider);
    return Text(resp);
    // final asyncTcpResp = ref.watch(tcpRespProvider);
    // return switch (asyncTcpResp) {
    //   AsyncValue(:final valueOrNull?) => Text(valueOrNull),
    //   AsyncValue(:final error?) => Text(error.toString()),
    //   _ => const CircularProgressIndicator(),
    // };
    // return asyncTcpResp.when(
    //   data: (data) => Text(data),
    //   error: (error, stackTrace) => Text(error.toString()),
    //   loading: () => const CircularProgressIndicator(),
    // );
  }
}


// @RoutePage()
// class TestTcpSocketPage extends StatefulWidget {
//   const TestTcpSocketPage({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<TestTcpSocketPage> {
//   late Socket socket;
//   late String message = "연결 중...";

//   @override
//   void initState() {
//     super.initState();
//     connectToServer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultLayoutWidget(
//       title: '',
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(message),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 socket.write('data');
//               },
//               child: const Text('랜덤 숫자 요청'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> connectToServer() async {
//     try {
//       socket = await Socket.connect('0koang.ddns.net', 3000); // 서버 IP 주소로 변경
//       setState(() {
//         message = '서버에 연결되었습니다.';
//       });

//       // 서버로부터 데이터를 받는 리스너 등록
//       socket.listen(
//         (List<int> event) {
//           String receivedMessage = utf8.decode(event);
//           setState(() {
//             message = '서버로부터 받은 데이터: $receivedMessage';
//           });
//         },
//         onError: (error) {
//           print('에러 발생: $error');
//           socket.destroy();
//           setState(() {
//             message = '서버와의 연결이 끊겼습니다.';
//           });
//         },
//         onDone: () {
//           print('연결이 종료되었습니다.');
//           socket.destroy();
//           setState(() {
//             message = '서버와의 연결이 끊겼습니다.';
//           });
//         },
//         cancelOnError: true,
//       );
//     } catch (e) {
//       print('에러 발생: $e');
//       setState(() {
//         message = '서버에 연결할 수 없습니다.';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     socket.destroy();
//     super.dispose();
//   }
// }
