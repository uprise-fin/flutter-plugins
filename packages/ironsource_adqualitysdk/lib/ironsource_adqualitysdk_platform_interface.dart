import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ironsource_adqualitysdk_method_channel.dart';

abstract class IronsourceAdqualitysdkPlatform extends PlatformInterface {
  /// Constructs a IronsourceAdqualitysdkPlatform.
  IronsourceAdqualitysdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static IronsourceAdqualitysdkPlatform _instance = MethodChannelIronsourceAdqualitysdk();

  /// The default instance of [IronsourceAdqualitysdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelIronsourceAdqualitysdk].
  static IronsourceAdqualitysdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IronsourceAdqualitysdkPlatform] when
  /// they register themselves.
  static set instance(IronsourceAdqualitysdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
