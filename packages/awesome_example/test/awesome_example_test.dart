import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_example/awesome_example.dart';
import 'package:awesome_example/awesome_example_platform_interface.dart';
import 'package:awesome_example/awesome_example_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAwesomeExamplePlatform
    with MockPlatformInterfaceMixin
    implements AwesomeExamplePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AwesomeExamplePlatform initialPlatform = AwesomeExamplePlatform.instance;

  test('$MethodChannelAwesomeExample is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAwesomeExample>());
  });

  test('getPlatformVersion', () async {
    AwesomeExample awesomeExamplePlugin = AwesomeExample();
    MockAwesomeExamplePlatform fakePlatform = MockAwesomeExamplePlatform();
    AwesomeExamplePlatform.instance = fakePlatform;

    expect(await awesomeExamplePlugin.getPlatformVersion(), '42');
  });
}
