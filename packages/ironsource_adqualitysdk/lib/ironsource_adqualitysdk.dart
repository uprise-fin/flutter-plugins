import 'ironsource_adqualitysdk_platform_interface.dart';

class IronsourceAdqualitysdk {
  Future<String?> initializeIronSource(String appKey) {
    return IronsourceAdqualitysdkPlatform.instance.initializeIronSource(appKey);
  }
}
