package io.heybit.pincrux_offerwall

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.pincrux.offerwall.PincruxOfferwall

/** PincruxOfferwallPlugin */
class PincruxOfferwallPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, PincruxOfferwallPluginConst.MAIN_CHANNEL)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == PincruxOfferwallPluginConst.INIT_WITH_USER_ID && call.hasArgument("pub_key") && call.hasArgument("user_id")) {
      val offerwall = PincruxOfferwall.getInstance()
      val key = call.argument<String>("pub_key")
      val id = call.argument<String>("user_id")
      offerwall.init(context, key, id)
      result.success(null)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
