package com.example.tapjoy

import android.content.Context
import java.util.Hashtable
import com.tapjoy.*
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** TapjoyPlugin */
class TapjoyPlugin : FlutterPlugin, MethodCallHandler {
  private var channel: MethodChannel? = null
  private var context: Context? = null
  private var offerwallPlacement: TJPlacement? = null
  val TAG = "TapjoyOfferwall"  // 로그 태그

  val connectFlags = Hashtable<String, Any>()

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "io.heybit.bitbunny/tapjoy")
    channel?.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "setUserId" -> {
        if (call.hasArgument("userId")) {
          connectFlags[TapjoyConnectFlag.ENABLE_LOGGING] = "true"
          connectFlags[TapjoyConnectFlag.USER_ID] = call.argument<String>("userId")!!
          result.success(null)
        } else {
          result.error("INVALID_ARGUMENT", "userId is required", null)
        }
      }
      "connect" -> {
        if (call.hasArgument("sdkKey")) {
          val connectListener = {
            fun onConnectSuccess() {
            }

            fun onConnectWarning(code: Int, message: String) {
            }

            fun onConnectFailure(code: Int, message: String) {
            }
          }

          context?.let { ctx ->
            Tapjoy.connect(ctx, call.argument<String>("sdkKey")!!, connectFlags)
            result.success(null)
          } ?: run {
            result.error("NO_CONTEXT", "Application context is not available", null)
          }
        } else {
          result.error("INVALID_ARGUMENT", "sdkKey is required", null)
        }
      }
      "getPlacement" -> {
        getPlacement()
        result.success(null)
      }
      "showContent" -> {
        showContent()
        result.success(null)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    channel = null
    context = null
  }

  private fun getPlacement() {
    offerwallPlacement = Tapjoy.getPlacement("gamecenter", object : TJPlacementListener {
        override fun onRequestSuccess(placement: TJPlacement) {
            // Implementation
        }
        override fun onRequestFailure(placement: TJPlacement, error: TJError) {
            // Implementation
        }
        override fun onContentReady(placement: TJPlacement) {
            TapjoyLog.i(TAG, "onContentReady for placement ${placement.name}")
        }
        override fun onContentShow(placement: TJPlacement) {
            TapjoyLog.i(TAG, "onContentShow for placement ${placement.name}")
        }
        override fun onContentDismiss(placement: TJPlacement) {
            TapjoyLog.i(TAG, "onContentDismiss for placement ${placement.name}")
        }
        override fun onPurchaseRequest(placement: TJPlacement, request: TJActionRequest, productId: String) {
            // Implementation
        }
        override fun onRewardRequest(placement: TJPlacement, request: TJActionRequest, itemId: String, quantity: Int) {
            // Implementation
        }
        override fun onClick(placement: TJPlacement) {
            TapjoyLog.i(TAG, "onClick for placement ${placement.name}")
        }
    })
    offerwallPlacement?.requestContent() ?: run {
        TapjoyLog.e(TAG, "Failed to create offerwall placement")
    }
  }

  private fun showContent() {
    offerwallPlacement?.showContent();
  }
}