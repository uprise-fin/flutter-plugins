import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'awesome_example_platform_interface.dart';

/// An implementation of [AwesomeExamplePlatform] that uses method channels.
class MethodChannelAwesomeExample extends AwesomeExamplePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('awesome_example');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
