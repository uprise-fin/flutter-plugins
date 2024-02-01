import 'package:flutter_test/flutter_test.dart';
import 'package:pincrux_offerwall/pincrux_offerwall.dart';
import 'package:pincrux_offerwall/pincrux_offerwall_platform_interface.dart';
import 'package:pincrux_offerwall/pincrux_offerwall_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPincruxOfferwallPlatform
    with MockPlatformInterfaceMixin
    implements PincruxOfferwallPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PincruxOfferwallPlatform initialPlatform = PincruxOfferwallPlatform.instance;

  test('$MethodChannelPincruxOfferwall is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPincruxOfferwall>());
  });

  test('getPlatformVersion', () async {
    PincruxOfferwall pincruxOfferwallPlugin = PincruxOfferwall();
    MockPincruxOfferwallPlatform fakePlatform = MockPincruxOfferwallPlatform();
    PincruxOfferwallPlatform.instance = fakePlatform;

    expect(await pincruxOfferwallPlugin.getPlatformVersion(), '42');
  });
}
