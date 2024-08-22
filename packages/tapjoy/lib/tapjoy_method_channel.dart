import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tapjoy_platform_interface.dart';

/// An implementation of [TapjoyPlatform] that uses method channels.
class MethodChannelTapjoy extends TapjoyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('io.heybit.bitbunny/tapjoy');

  @override
  Future<String?> setUserId(String userId) async {
    final result =
        await methodChannel.invokeMethod('setUserId', {'userId': userId});

    return result;
  }

  @override
  Future<String?> connect(String sdkKey) async {
    final result =
        await methodChannel.invokeMethod('connect', {'sdkKey': sdkKey});

    return result;
  }

  @override
  Future<String?> getPlacement() async {
    final result = await methodChannel.invokeMethod('getPlacement');

    return result;
  }

  @override
  Future<String?> showContent() async {
    final result = await methodChannel.invokeMethod('showContent');

    return result;
  }
}
