import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_flutter/src/common/enums.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/pages/test_social_login/login/social_login.dart';
import 'package:test_flutter/src/pages/test_social_login/model/social_login_model.dart';

class GoogleLogin extends SocialLogin {
  @override
  Future<bool> login() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // // Once signed in, return the UserCredential
    // await FirebaseAuth.instance.signInWithCredential(credential);

    return googleUser != null;
  }

  @override
  Future<bool> logout() async {
    await GoogleSignIn().signOut();
    return true;
  }

  @override
  Future<bool> disconnect() async {
    await GoogleSignIn().disconnect();
    return true;
  }

  @override
  Future<SocialLoginModel> getModel() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Log.d(
        'accessToken : ${googleAuth?.accessToken} / idToken : ${googleAuth?.idToken}');

    // Once signed in, return the UserCredential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return SocialLoginModel(
      loginType: SocialLoginType.google,
      googleUser: userCredential.user,
    );
  }
}
