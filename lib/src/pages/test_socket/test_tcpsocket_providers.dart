import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';

part 'test_tcpsocket_providers.g.dart';

const url = '0koang.ddns.net';
const port = 3000;

@Riverpod(keepAlive: true)
class TcpSocket extends _$TcpSocket {
  late ConnectionTask<Socket> _socketConnectionTask;
  late StreamSubscription? _socketStreamSub;

  @override
  Future<Socket> build() async {
    return await _getSocket(url: url);
  }

  Future<Socket> _getSocket({required String url}) async {
    final respNotifier = ref.read(tcpRespProvider.notifier);
    respNotifier.loading();

    // 테스트 지연
    await Future.delayed(const Duration(seconds: 1));

    _socketConnectionTask = await Socket.startConnect(url, port);
    final socket = await _socketConnectionTask.socket;

    respNotifier.updateResp('소켓 연결 완료');

    _socketStreamSub = socket.listen(
      (List<int> event) {
        String receivedMessage = utf8.decode(event);
        respNotifier.updateResp('서버에서 받은 데이터 : $receivedMessage');
      },
      onError: (error) {
        respNotifier.updateResp('에러로 인한 서버 연결 종료 : $error');
        close();
      },
      onDone: () {
        respNotifier.updateResp('서버 연결 종료');
        close();
      },
      cancelOnError: true,
    );

    return socket;
  }

  reconnect() async {
    close();
    ref.read(tcpRespProvider.notifier).updateResp('재연결');
    state = await AsyncValue.guard(
      () => _getSocket(url: url),
    );
  }

  write({required String msg}) {
    state.asData?.value.write(msg);
  }

  close() async {
    try {
      ref.read(tcpRespProvider.notifier).updateResp('연결 종료');
      _socketConnectionTask.cancel();
      await _socketStreamSub?.cancel();
      await state.asData?.value.close();
    } catch (e) {
      Log.e(e);
    }
  }
}

@riverpod
class TcpResp extends _$TcpResp {
  @override
  FutureOr<String> build() {
    return '';
  }

  loading() {
    state = const AsyncLoading();
  }

  updateResp(String msg) {
    state = AsyncData(msg);
  }
}











// @riverpod
// class TcpResp extends _$TcpResp {
//   @override
//   Stream<String> build() async* {
//     ref.printLifeCycle(tag: 'TcpResp');
//     final asyncSocket = ref.watch(tcpSocketProvider);
//     Log.d('asyncSocket = $asyncSocket');
//     asyncSocket.when(
//       data: (socket) {
//         Log.d('asyncSocket = $asyncSocket');
//         state = const AsyncData('서버 연결 완료');
//         socket.listen(
//           (List<int> event) {
//             String receivedMessage = utf8.decode(event);
//             final msg = '서버에서 받은 데이터 : $receivedMessage';
//             state = AsyncData(msg);
//           },
//           onError: (error) {
//             final msg = '에러로 인한 서버 연결 종료 : $error';
//             state = AsyncData(msg);
//           },
//           onDone: () {
//             const msg = '서버 연결 종료';
//             state = const AsyncData(msg);
//           },
//           cancelOnError: true,
//         );
//       },
//       error: (error, stackTrace) {
//         state = AsyncError(error, stackTrace);
//       },
//       loading: () {
//         state = const AsyncLoading();
//       },
//     );
//   }
// }

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