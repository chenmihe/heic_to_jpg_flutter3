import 'package:flutter_test/flutter_test.dart';
import 'package:heic_to_jpg_flutter3/heic_to_jpg_flutter3.dart';
import 'package:heic_to_jpg_flutter3/heic_to_jpg_flutter3_method_channel.dart';
import 'package:heic_to_jpg_flutter3/heic_to_jpg_flutter3_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHeicToJpgFlutter3Platform
    with MockPlatformInterfaceMixin
    implements HeicToJpgFlutter3Platform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HeicToJpgFlutter3Platform initialPlatform =
      HeicToJpgFlutter3Platform.instance;

  test('$MethodChannelHeicToJpgFlutter3 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHeicToJpgFlutter3>());
  });

  test('getPlatformVersion', () async {
    HeicToJpgFlutter3 heicToJpgFlutter3Plugin = HeicToJpgFlutter3();
    MockHeicToJpgFlutter3Platform fakePlatform =
        MockHeicToJpgFlutter3Platform();
    HeicToJpgFlutter3Platform.instance = fakePlatform;

    // expect(await heicToJpgFlutter3Plugin.getPlatformVersion(), '42');
  });
}
