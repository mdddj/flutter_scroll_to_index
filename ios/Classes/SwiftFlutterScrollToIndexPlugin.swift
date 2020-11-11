import Flutter
import UIKit

public class SwiftFlutterScrollToIndexPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_scroll_to_index", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterScrollToIndexPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
