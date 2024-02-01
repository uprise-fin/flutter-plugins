import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pincrux_offerwall/pincrux_offerwall_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPincruxOfferwall platform = MethodChannelPincruxOfferwall();
  const MethodChannel channel = MethodChannel('pincrux_offerwall');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
