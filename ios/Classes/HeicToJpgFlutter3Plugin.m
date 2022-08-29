#import "HeicToJpgFlutter3Plugin.h"
#if __has_include(<heic_to_jpg_flutter3/heic_to_jpg_flutter3-Swift.h>)
#import <heic_to_jpg_flutter3/heic_to_jpg_flutter3-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "heic_to_jpg_flutter3-Swift.h"
#endif

@implementation HeicToJpgFlutter3Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHeicToJpgFlutter3Plugin registerWithRegistrar:registrar];
}
@end
