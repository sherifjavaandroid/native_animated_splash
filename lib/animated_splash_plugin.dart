// animated_splash_plugin.dart
import 'package:flutter/services.dart';

class AnimatedSplashPlugin {
  static const MethodChannel _channel = MethodChannel('animated_splash_plugin');

  static Future<void> launchSplash() async {
    try {
      await _channel.invokeMethod('launchAnimatedSplash');
    } catch (e) {
      print('Error launching splash screen: $e');
    }
  }
}
