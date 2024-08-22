import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tapjoy_platform_interface.dart';

/// An implementation of [TapjoyPlatform] that uses method channels.
class MethodChannelTapjoy extends TapjoyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tapjoy');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
