import 'dart:convert';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_tcpsocket_providers.g.dart';

const url = '0koang.ddns.net';
const port = 3000;

@Riverpod(keepAlive: true)
class TcpSocket extends _$TcpSocket {
  late Socket socket;

  @override
  Future<Socket> build() async {
    return await _getSocket(url: url);
  }

  Future<Socket> _getSocket({required String url}) async {
    socket = await Socket.connect(url, port);

    final respNotifier = ref.read(tcpRespProvider.notifier);
    respNotifier.update('서버 연결 완료');

    socket.listen(
      (List<int> event) {
        String receivedMessage = utf8.decode(event);
        final msg = '서버에서 받은 데이터 : $receivedMessage';
        respNotifier.update(msg);
      },
      onError: (error) {
        final msg = '에러로 인한 서버 연결 종료 : $error';
        respNotifier.update(msg);
      },
      onDone: () {
        const msg = '서버 연결 종료';
        respNotifier.update(msg);
      },
      cancelOnError: true,
    );

    return socket;
  }

  Future<void> reconnect() async {
    state = await AsyncValue.guard(
      () => _getSocket(url: url),
    );
  }

  write({required String msg}) {
    state.asData?.value.write(msg);
  }

  close() {
    state.asData?.value.close();
  }
}

@riverpod
class TcpResp extends _$TcpResp {
  @override
  String build() {
    return '';
  }

  update(String msg) {
    state = msg;
  }
}

// @riverpod
// class TcpResp extends _$TcpResp {
//   @override
//   Stream<String> build() async* {
//     final asyncSocket = ref.watch(tcpSocketProvider);
//     yield asyncSocket.when(
//       data: (socket) {
//         socket.listen(
//           (List<int> event) {
//             String receivedMessage = utf8.decode(event);
//             '서버로부터 받은 데이터 : $receivedMessage';
//           },
//           onError: (error) {
//             '에러로 인한 서버 연결 종료 : $error';
//           },
//           onDone: () {
//             '서버 연결 정상 종료';
//           },
//           cancelOnError: true,
//         );

//         return '';
//       },
//       error: (error, stackTrace) => '서버 소켓 에러 : $error',
//       loading: () => '서버 연결중',
//     );
//   }

//   // FutureOr<String> _getMsg() async {
//   // try {
//   //   socket.listen(
//   //     (List<int> event) {
//   //       String receivedMessage = utf8.decode(event);
//   //       return '서버로부터 받은 데이터: $receivedMessage';
//   //     },
//   //     onError: (error) {
//   //       return '서버와의 연결이 끊겼습니다.';
//   //     },
//   //     onDone: () {
//   //       print('연결이 종료되었습니다.');
//   //       socket.destroy();
//   //       setState(() {
//   //         message = '서버와의 연결이 끊겼습니다.';
//   //       });
//   //     },
//   //     cancelOnError: true,
//   //   );
//   // } catch (e) {
//   //   Log.d('에러 발생: $e');
//   //   socket.destroy();
//   //   return '서버와의 연결이 끊겼습니다.';
//   // }
//   // }
// }