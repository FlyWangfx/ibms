package com.blueearth.ibms

import android.annotation.SuppressLint
import android.content.Intent
import android.net.Uri
import android.os.StrictMode
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL = "CAD"
    }

    private lateinit var channel: MethodChannel

    @SuppressLint("IntentReset")
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { methodCall: MethodCall, result: MethodChannel.Result ->
            if (methodCall.method == "opencad") {
                val path = methodCall.argument("path") as String?
                val intent = Intent(Intent.ACTION_VIEW)
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                intent.setDataAndType(Uri.parse(path), "application/x-autocad");
                context.startActivity(Intent.createChooser(intent,"请选择对应的软件打开"))
            }
            else
                result.notImplemented()
        }
    }
}
