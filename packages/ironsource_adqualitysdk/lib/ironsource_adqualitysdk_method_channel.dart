import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ironsource_adqualitysdk_platform_interface.dart';

/// An implementation of [IronsourceAdqualitysdkPlatform] that uses method channels.
class MethodChannelIronsourceAdqualitysdk
    extends IronsourceAdqualitysdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel("io.heybit.bitbunny/ironsource_adqualitysdk");

  @override
  Future<String?> initializeIronSource(String appKey) async {
    final result = await methodChannel
        .invokeMethod('initializeIronSource', {'appKey': appKey});

    return result;
  }
}
