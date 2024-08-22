
import 'tapjoy_platform_interface.dart';

class Tapjoy {
  Future<String?> getPlatformVersion() {
    return TapjoyPlatform.instance.getPlatformVersion();
  }
}
