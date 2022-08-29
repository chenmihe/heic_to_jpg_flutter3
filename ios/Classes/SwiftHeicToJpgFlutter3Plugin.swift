import Flutter
import UIKit

public class SwiftHeicToJpgFlutter3Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "heic_to_jpg_flutter3", binaryMessenger: registrar.messenger())
    let instance = SwiftHeicToJpgFlutter3Plugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

      if(call.method == "convert"){
              let dic = call.arguments as! Dictionary<String, Any>
              let heicPath = dic["heicPath"] as! String
              var jpgPath :String?
              if(!(dic["jpgPath"] is NSNull)){
                  jpgPath = dic["jpgPath"] as! String?
              }
              if(jpgPath == nil || jpgPath!.isEmpty){
                  jpgPath = NSTemporaryDirectory().appendingFormat("%d.jpg", Date().timeIntervalSince1970 * 1000)
              }
              result(fromHeicToJpg(heicPath: heicPath, jpgPath: jpgPath!))
          }
  }

  func fromHeicToJpg(heicPath: String, jpgPath: String) -> String? {
              let heicImage : UIImage? = UIImage(named:heicPath)
              if heicImage == nil {
                return nil
              }
              let jpgImageData = heicImage!.jpegData(compressionQuality: 1.0)
              FileManager.default.createFile(atPath: jpgPath, contents: jpgImageData, attributes: nil)
              return jpgPath
          }

}
