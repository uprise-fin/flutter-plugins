import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pincrux_offerwall_platform_interface.dart';

/// An implementation of [PincruxOfferwallPlatform] that uses method channels.
class MethodChannelPincruxOfferwall extends PincruxOfferwallPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('io.heybit.bitbunny/pincrux_offerwall');

  @override
  Future<String?> initWithUserId(String pubKey, String userId) async {
    final version = await methodChannel.invokeMethod<String>(
        'initWithUserId', {'pub_key': pubKey, 'user_id': userId});
    return version;
  }
}
