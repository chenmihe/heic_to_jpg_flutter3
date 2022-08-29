import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'heic_to_jpg_flutter3_method_channel.dart';

abstract class HeicToJpgFlutter3Platform extends PlatformInterface {
  /// Constructs a HeicToJpgFlutter3Platform.
  HeicToJpgFlutter3Platform() : super(token: _token);

  static final Object _token = Object();

  static HeicToJpgFlutter3Platform _instance = MethodChannelHeicToJpgFlutter3();

  /// The default instance of [HeicToJpgFlutter3Platform] to use.
  ///
  /// Defaults to [MethodChannelHeicToJpgFlutter3].
  static HeicToJpgFlutter3Platform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HeicToJpgFlutter3Platform] when
  /// they register themselves.
  static set instance(HeicToJpgFlutter3Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
