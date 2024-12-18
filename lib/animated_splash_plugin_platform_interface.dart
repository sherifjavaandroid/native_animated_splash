// animated_splash_plugin_platform_interface.dart
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'animated_splash_plugin_method_channel.dart';

abstract class AnimatedSplashPluginPlatform extends PlatformInterface {
  AnimatedSplashPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnimatedSplashPluginPlatform _instance = MethodChannelAnimatedSplashPlugin();

  static AnimatedSplashPluginPlatform get instance => _instance;

  static set instance(AnimatedSplashPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> launchSplash();
}