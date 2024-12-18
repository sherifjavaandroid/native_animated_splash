import Flutter
import UIKit
import Lottie

public class SwiftAnimatedSplashPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "animated_splash_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftAnimatedSplashPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "launchAnimatedSplash" {
            if let splashView = createSplashView() {
                UIApplication.shared.windows.first?.addSubview(splashView)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    splashView.removeFromSuperview()
                    result(nil)
                }
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

   private func createSplashView() -> UIView? {
       let splashView = UIView(frame: UIScreen.main.bounds)
       splashView.backgroundColor = UIColor.white
       let animationView = AnimationView(name: "splash_animation") // Make sure the file is in Assets
       animationView.frame = splashView.bounds
       animationView.contentMode = .scaleAspectFit
       animationView.play { _ in
           splashView.removeFromSuperview()
       }
       splashView.addSubview(animationView)
       return splashView
   }

}
