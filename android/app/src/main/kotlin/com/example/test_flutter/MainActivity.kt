package com.example.test_flutter

import android.os.Build
import androidx.annotation.NonNull
import androidx.lifecycle.lifecycleScope
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.test_flutter").setMethodCallHandler { call, result ->
            if (call.method == "getPlatformVersion") {
                 lifecycleScope.launch {
                     delay(3000)
                     result.success("Android version is " + Build.VERSION.RELEASE)
                 }
            } else {
                result.notImplemented()
            }
        }
    }

}
