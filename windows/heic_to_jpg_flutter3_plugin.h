#ifndef FLUTTER_PLUGIN_HEIC_TO_JPG_FLUTTER3_PLUGIN_H_
#define FLUTTER_PLUGIN_HEIC_TO_JPG_FLUTTER3_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace heic_to_jpg_flutter3 {

class HeicToJpgFlutter3Plugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HeicToJpgFlutter3Plugin();

  virtual ~HeicToJpgFlutter3Plugin();

  // Disallow copy and assign.
  HeicToJpgFlutter3Plugin(const HeicToJpgFlutter3Plugin&) = delete;
  HeicToJpgFlutter3Plugin& operator=(const HeicToJpgFlutter3Plugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace heic_to_jpg_flutter3

#endif  // FLUTTER_PLUGIN_HEIC_TO_JPG_FLUTTER3_PLUGIN_H_
