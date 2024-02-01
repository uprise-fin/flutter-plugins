
import 'pincrux_offerwall_platform_interface.dart';

class PincruxOfferwall {
  Future<String?> getPlatformVersion() {
    return PincruxOfferwallPlatform.instance.getPlatformVersion();
  }
}
