import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_method_channel_view_model.g.dart';

@riverpod
class PlatformVersion extends _$PlatformVersion {
  static const MethodChannel _channel =
      MethodChannel('com.example.test_flutter');

  @override
  String build() {
    return '??????';
  }

  Future<void> getPlatformVersion() async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    state = version;
  }
}
