package com.example.ironsource_adqualitysdk_example

import android.util.Log
import com.ironsource.adqualitysdk.sdk.IronSourceAdQuality
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

private val CHANNEL = "io.heybit.bitbunny/ironsource_adqualitysdk"

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call,
                result ->
            when (call.method) {
                "initializeIronSource" -> {
                    val appKey = call.argument<String>("appKey") ?: return@setMethodCallHandler
                    IronSourceAdQuality.getInstance().initialize(this, appKey)
                    result.success("IronSourceAdQuality initialized")
                }
                else -> result.notImplemented()
            }
        }
    }
}
