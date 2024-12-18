import 'package:flutter_test/flutter_test.dart';
import 'package:animated_splash_plugin/animated_splash_plugin.dart';
import 'package:animated_splash_plugin/animated_splash_plugin_platform_interface.dart';
import 'package:animated_splash_plugin/animated_splash_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnimatedSplashPluginPlatform
    with MockPlatformInterfaceMixin
    implements AnimatedSplashPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnimatedSplashPluginPlatform initialPlatform = AnimatedSplashPluginPlatform.instance;

  test('$MethodChannelAnimatedSplashPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnimatedSplashPlugin>());
  });

  test('getPlatformVersion', () async {
    AnimatedSplashPlugin animatedSplashPlugin = AnimatedSplashPlugin();
    MockAnimatedSplashPluginPlatform fakePlatform = MockAnimatedSplashPluginPlatform();
    AnimatedSplashPluginPlatform.instance = fakePlatform;

    expect(await animatedSplashPlugin.getPlatformVersion(), '42');
  });
}
