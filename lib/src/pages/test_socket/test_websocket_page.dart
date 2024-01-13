import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

@RoutePage()
class TestWebSocketPage extends HookConsumerWidget {
  const TestWebSocketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayoutWidget(
      title: '',
      child: ElevatedButton(
        onPressed: () {
          _connect();
        },
        child: const Text('Test web socket'),
      ),
    );
  }

  _connect() async {
    // todo kyk 미완료
    final wsUrl = Uri.parse('ws://localhost:3000');
    final channel = WebSocketChannel.connect(wsUrl);

    await channel.stream.forEach((message) {
      print('Received: $message');
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
  }
}
