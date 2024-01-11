import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ironsource_adqualitysdk_platform_interface.dart';

/// An implementation of [IronsourceAdqualitysdkPlatform] that uses method channels.
class MethodChannelIronsourceAdqualitysdk extends IronsourceAdqualitysdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ironsource_adqualitysdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
