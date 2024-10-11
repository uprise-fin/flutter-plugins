package com.ironSource.ironsource_mediation

import android.util.Log
import android.app.Activity
import io.flutter.plugin.common.MethodChannel

abstract class IronSourceListener(protected val channel: MethodChannel) {
  var activity: Activity? = null

  protected fun invokeMethod(methodName: String, args: Any? = null) {
    Log.d("IronSourceListener", "this: ${this.toString()}, activity: ${activity?.toString()}")
    LevelPlayUtils.invokeChannelMethod(activity, channel, methodName, args)
  }
}
