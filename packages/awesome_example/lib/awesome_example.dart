
import 'awesome_example_platform_interface.dart';

class AwesomeExample {
  Future<String?> getPlatformVersion() {
    return AwesomeExamplePlatform.instance.getPlatformVersion();
  }
}
