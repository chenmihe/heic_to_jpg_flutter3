import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'heic_to_jpg_flutter3_platform_interface.dart';

/// An implementation of [HeicToJpgFlutter3Platform] that uses method channels.
class MethodChannelHeicToJpgFlutter3 extends HeicToJpgFlutter3Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('heic_to_jpg_flutter3');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
