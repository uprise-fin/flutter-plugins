import 'package:flutter_test/flutter_test.dart';
import 'package:tapjoy/tapjoy.dart';
import 'package:tapjoy/tapjoy_platform_interface.dart';
import 'package:tapjoy/tapjoy_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTapjoyPlatform
    with MockPlatformInterfaceMixin
    implements TapjoyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TapjoyPlatform initialPlatform = TapjoyPlatform.instance;

  test('$MethodChannelTapjoy is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTapjoy>());
  });

  test('getPlatformVersion', () async {
    Tapjoy tapjoyPlugin = Tapjoy();
    MockTapjoyPlatform fakePlatform = MockTapjoyPlatform();
    TapjoyPlatform.instance = fakePlatform;

    expect(await tapjoyPlugin.getPlatformVersion(), '42');
  });
}
