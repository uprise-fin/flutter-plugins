import 'package:flutter_test/flutter_test.dart';
import 'package:ironsource_adqualitysdk/ironsource_adqualitysdk.dart';
import 'package:ironsource_adqualitysdk/ironsource_adqualitysdk_platform_interface.dart';
import 'package:ironsource_adqualitysdk/ironsource_adqualitysdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIronsourceAdqualitysdkPlatform
    with MockPlatformInterfaceMixin
    implements IronsourceAdqualitysdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IronsourceAdqualitysdkPlatform initialPlatform = IronsourceAdqualitysdkPlatform.instance;

  test('$MethodChannelIronsourceAdqualitysdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIronsourceAdqualitysdk>());
  });

  test('getPlatformVersion', () async {
    IronsourceAdqualitysdk ironsourceAdqualitysdkPlugin = IronsourceAdqualitysdk();
    MockIronsourceAdqualitysdkPlatform fakePlatform = MockIronsourceAdqualitysdkPlatform();
    IronsourceAdqualitysdkPlatform.instance = fakePlatform;

    expect(await ironsourceAdqualitysdkPlugin.getPlatformVersion(), '42');
  });
}
