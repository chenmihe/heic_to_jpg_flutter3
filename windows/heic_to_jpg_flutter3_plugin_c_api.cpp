#include "include/heic_to_jpg_flutter3/heic_to_jpg_flutter3_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "heic_to_jpg_flutter3_plugin.h"

void HeicToJpgFlutter3PluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  heic_to_jpg_flutter3::HeicToJpgFlutter3Plugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
