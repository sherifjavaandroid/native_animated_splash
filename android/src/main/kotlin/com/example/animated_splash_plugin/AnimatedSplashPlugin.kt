package com.hythamsherif.animated_splash_plugin

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.airbnb.lottie.LottieAnimationView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class AnimatedSplashActivity : AppCompatActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.splash_screen)

    val animationView = findViewById<LottieAnimationView>(R.id.splashAnimation)
    animationView.setAnimation("splash_animation.json")
    animationView.playAnimation()
    animationView.addAnimatorListener(object : Animator.AnimatorListener {
      override fun onAnimationEnd(animation: Animator?) {
        navigateToMainActivity()
      }

      override fun onAnimationStart(animation: Animator?) {}
      override fun onAnimationCancel(animation: Animator?) {}
      override fun onAnimationRepeat(animation: Animator?) {}
    })
  }

  private fun navigateToMainActivity() {
    startActivity(FlutterActivity.createDefaultIntent(this))
    finish()
  }
}

class AnimatedSplashPlugin : MethodChannel.MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: PluginRegistry.Registrar) {
      val channel = MethodChannel(registrar.messenger(), "animated_splash_plugin")
      channel.setMethodCallHandler(AnimatedSplashPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "launchAnimatedSplash") {
      val intent = Intent(registrar.context(), AnimatedSplashActivity::class.java)
      registrar.context().startActivity(intent)
      result.success(null)
    } else {
      result.notImplemented()
    }
  }
}