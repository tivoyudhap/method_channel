import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flutterViewController: FlutterViewController = self.window.rootViewController as! FlutterViewController
    let flutterMethodChannel: FlutterMethodChannel = FlutterMethodChannel(name: "com.tivoyudha.method_channel_app.channel", binaryMessenger: flutterViewController.binaryMessenger)
    flutterMethodChannel.setMethodCallHandler { (methodCall, result) in
        if (methodCall.method.elementsEqual("showNativeView")) {
            let viewController: NextViewController = NextViewController(nibName: "NextViewController", bundle: nil)
            self.window.rootViewController?.present(viewController, animated: true, completion: nil)
        } else {
            print("Not implemented yet")
        }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
