import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heic_to_jpg_flutter3/heic_to_jpg_flutter3_method_channel.dart';

void main() {
  MethodChannelHeicToJpgFlutter3 platform = MethodChannelHeicToJpgFlutter3();
  const MethodChannel channel = MethodChannel('heic_to_jpg_flutter3');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
