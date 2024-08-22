import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tapjoy_method_channel.dart';

abstract class TapjoyPlatform extends PlatformInterface {
  /// Constructs a TapjoyPlatform.
  TapjoyPlatform() : super(token: _token);

  static final Object _token = Object();

  static TapjoyPlatform _instance = MethodChannelTapjoy();

  /// The default instance of [TapjoyPlatform] to use.
  ///
  /// Defaults to [MethodChannelTapjoy].
  static TapjoyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TapjoyPlatform] when
  /// they register themselves.
  static set instance(TapjoyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> setUserId(String userId) {
    throw UnimplementedError('setUserId() has not been implemented.');
  }

  Future<String?> connect(String sdkKey) {
    throw UnimplementedError('connect() has not been implemented.');
  }

  Future<String?> getPlacement() {
    throw UnimplementedError('getPlacement() has not been implemented.');
  }

  Future<String?> showContent() {
    throw UnimplementedError('showContent() has not been implemented.');
  }
}
