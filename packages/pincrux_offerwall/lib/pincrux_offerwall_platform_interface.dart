import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pincrux_offerwall_method_channel.dart';

abstract class PincruxOfferwallPlatform extends PlatformInterface {
  /// Constructs a PincruxOfferwallPlatform.
  PincruxOfferwallPlatform() : super(token: _token);

  static final Object _token = Object();

  static PincruxOfferwallPlatform _instance = MethodChannelPincruxOfferwall();

  /// The default instance of [PincruxOfferwallPlatform] to use.
  ///
  /// Defaults to [MethodChannelPincruxOfferwall].
  static PincruxOfferwallPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PincruxOfferwallPlatform] when
  /// they register themselves.
  static set instance(PincruxOfferwallPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> initWithUserId(String pubKey, String userId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
