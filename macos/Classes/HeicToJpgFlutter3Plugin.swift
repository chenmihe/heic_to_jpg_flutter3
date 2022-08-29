import Cocoa
import FlutterMacOS

public class HeicToJpgFlutter3Plugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "heic_to_jpg_flutter3", binaryMessenger: registrar.messenger)
    let instance = HeicToJpgFlutter3Plugin()
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
//      switch call.method {
//      case "getPlatformVersion":
//        result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
//      case "convert":
//
//      default:
//        result(FlutterMethodNotImplemented)
//      }
  }
   func fromHeicToJpg(heicPath: String, jpgPath: String) -> String?{
                 let heicImage : NSImage?  = NSImage(contentsOfFile: heicPath)
                 if heicImage == nil {
                  return nil
                 }
                 let  jpegData = jpegDataFrom(image:heicImage!)
                 FileManager.default.createFile(atPath: jpgPath, contents: jpegData, attributes: nil)
                 return jpgPath
            }

    func jpegDataFrom(image:NSImage) -> Data {
            let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil)!
            let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
            let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
            return jpegData
        }
}
