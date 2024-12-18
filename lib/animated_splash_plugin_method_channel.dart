// animated_splash_plugin_method_channel.dart
import 'package:flutter/services.dart';
import 'animated_splash_plugin_platform_interface.dart';

class MethodChannelAnimatedSplashPlugin extends AnimatedSplashPluginPlatform {
  final MethodChannel _channel = MethodChannel('animated_splash_plugin');

  @override
  Future<void> launchSplash() async {
    await _channel.invokeMethod('launchAnimatedSplash');
  }
}
