import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/app.dart';

void main() {
  // runApp(const App());
  runApp(const ProviderScope(child: App()));
}
