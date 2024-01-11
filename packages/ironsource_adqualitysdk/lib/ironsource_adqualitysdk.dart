
import 'ironsource_adqualitysdk_platform_interface.dart';

class IronsourceAdqualitysdk {
  Future<String?> getPlatformVersion() {
    return IronsourceAdqualitysdkPlatform.instance.getPlatformVersion();
  }
}
