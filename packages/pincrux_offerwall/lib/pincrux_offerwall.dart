import 'pincrux_offerwall_platform_interface.dart';

class PincruxOfferwall {
  Future<String?> initWithUserId(String pubKey, String userId) {
    return PincruxOfferwallPlatform.instance.initWithUserId(pubKey, userId);
  }
}
