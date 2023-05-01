package com.example.test_flutter

import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.test_flutter").setMethodCallHandler { call, result ->
            if (call.method == "getPlatformVersion") {
                result.success("Android version is " + Build.VERSION.RELEASE);
            } else {
                result.notImplemented()
            }
        }
    }

}
