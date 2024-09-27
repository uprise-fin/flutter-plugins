import 'dart:io';

import 'tapjoy_platform_interface.dart';

class Tapjoy {
  Future<String?> setUserId(String userId) async {
    if (Platform.isAndroid) {
      return TapjoyPlatform.instance.setUserId(userId);
    }
    return Future.value(null); // No-op for iOS
  }

  Future<String?> connect(String sdkKey) async {
    if (Platform.isAndroid) {
      return TapjoyPlatform.instance.connect(sdkKey);
    }
    return Future.value(null); // No-op for iOS
  }

  Future<String?> getPlacement() async {
    if (Platform.isAndroid) {
      return TapjoyPlatform.instance.getPlacement();
    }
    return Future.value(null); // No-op for iOS
  }

  Future<String?> showContent() async {
    if (Platform.isAndroid) {
      return TapjoyPlatform.instance.showContent();
    }
    return Future.value(null); // No-op for iOS
  }
}
