package com.tivoyudha.method_channel_app

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import android.widget.Toast

class MainActivity: FlutterActivity() {

    companion object {
        const val CHANNEL = "com.tivoyudha.method_channel_app.channel"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { methodCall, result ->
            if (methodCall.method.equals("showNativeView", ignoreCase = false)) {
                val intent = Intent(this, NextActivity::class.java)
                startActivity(intent)
            } else {
                result.notImplemented()
            }
        }
    }
}
