import 'package:flutter/material.dart';

// canvaskit 빌드 시 한글 및 이모지 깨짐 현상 피하기 위해 글꼴 미리 로드
class PreLoadWidget extends StatelessWidget {
  const PreLoadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Offstage(
      child: Text('가💖'),
    );
  }
}
