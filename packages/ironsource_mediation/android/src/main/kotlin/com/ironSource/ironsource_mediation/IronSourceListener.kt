package com.ironSource.ironsource_mediation

import android.util.Log
import android.app.Activity
import io.flutter.plugin.common.MethodChannel

abstract class IronSourceListener(protected val channel: MethodChannel) {
  var activity: Activity? = null

  protected fun invokeMethod(methodName: String, args: Any? = null) {
    Log.i("IRONSOURCE_DEBUG", methodName)
    LevelPlayUtils.invokeChannelMethod(activity, channel, methodName, args)
  }
}
