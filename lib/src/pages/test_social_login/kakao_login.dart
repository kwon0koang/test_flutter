import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/pages/test_social_login/social_login.dart';

class KakaoLogin extends SocialLogin {
  @override
  Future<bool> login() async {
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        Log.d('카카오톡으로 로그인 성공');
        return true;
      } catch (error) {
        Log.d('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return false;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          Log.d('카카오계정으로 로그인 성공');
          return true;
        } catch (error) {
          Log.d('카카오계정으로 로그인 실패 $error');
          return false;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        Log.d('카카오계정으로 로그인 성공');
        return true;
      } catch (error) {
        Log.d('카카오계정으로 로그인 실패 $error');
        return false;
      }
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.logout();
      Log.d('로그아웃 성공, SDK에서 토큰 삭제');
      return true;
    } catch (error) {
      Log.d('로그아웃 실패, SDK에서 토큰 삭제 $error');
      return false;
    }
  }

  @override
  Future<bool> disconnect() async {
    try {
      await UserApi.instance.unlink();
      Log.d('연결 끊기 성공, SDK에서 토큰 삭제');
      return true;
    } catch (error) {
      Log.d('연결 끊기 실패 $error');
      return false;
    }
  }
}
