import Flutter
import UIKit
import IronSourceAdQualitySDK

public class IronsourceAdqualitysdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "io.heybit.bitbunny/ironsource_adqualitysdk", binaryMessenger: registrar.messenger())
    let instance = IronsourceAdqualitysdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initializeIronSource":
      if let args = call.arguments as? [String: Any],
         let appKey = args["appKey"] as? String {
        IronSourceAdQuality.getInstance().initialize(withAppKey: appKey)
        result(nil)
      }
    case "setUserId":
      if let args = call.arguments as? [String: Any],
        let userId = args["userId"] as? String {
        IronSourceAdQuality.getInstance().changeUserId(userId)
        result(nil)
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
