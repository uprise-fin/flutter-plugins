import 'tapjoy_platform_interface.dart';

class Tapjoy {
  Future<String?> setUserId(String userId) {
    return TapjoyPlatform.instance.setUserId(userId);
  }

  Future<String?> connect(String sdkKey) {
    return TapjoyPlatform.instance.connect(sdkKey);
  }

  Future<String?> getPlacement() {
    return TapjoyPlatform.instance.getPlacement();
  }

  Future<String?> showContent() {
    return TapjoyPlatform.instance.showContent();
  }
}
