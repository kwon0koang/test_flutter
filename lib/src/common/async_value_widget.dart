import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.asyncValue,
    required this.data,
  }) : super(key: key);

  final AsyncValue<T> asyncValue;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      error: (error, stackTrace) {
        return Center(
          child: Text('에러입니다 ($error)'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      data: data,
    );
  }
}
