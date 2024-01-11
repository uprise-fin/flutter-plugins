import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ironsource_adqualitysdk/ironsource_adqualitysdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelIronsourceAdqualitysdk platform = MethodChannelIronsourceAdqualitysdk();
  const MethodChannel channel = MethodChannel('ironsource_adqualitysdk');

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
