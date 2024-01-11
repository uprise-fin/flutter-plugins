import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'awesome_example_method_channel.dart';

abstract class AwesomeExamplePlatform extends PlatformInterface {
  /// Constructs a AwesomeExamplePlatform.
  AwesomeExamplePlatform() : super(token: _token);

  static final Object _token = Object();

  static AwesomeExamplePlatform _instance = MethodChannelAwesomeExample();

  /// The default instance of [AwesomeExamplePlatform] to use.
  ///
  /// Defaults to [MethodChannelAwesomeExample].
  static AwesomeExamplePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AwesomeExamplePlatform] when
  /// they register themselves.
  static set instance(AwesomeExamplePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
