import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heic_to_jpg_flutter3/heic_to_jpg_flutter3.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String heicUrl =
      'https://testforap.pinshop.com/wp-content/uploads/2022/08/IMG_0006-1.heic';
  String? jpeg;
  bool initialized = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (initialized) return;
    initialized = true;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      String? tmp = await downloadAndConvert();
      print('tmp---$tmp');
      setState(() {
        jpeg = tmp;
      });
    });
  }

  Future<String?> downloadAndConvert() async {
    File heicFile = await _downloadFile(heicUrl, 'a.heic');
    String convertedPath = "${(await getTemporaryDirectory()).path}/b.heic";
    return HeicToJpgFlutter3.convert(heicFile.path, jpgPath: convertedPath);
  }

  @override
  Widget build(BuildContext context) {
    initPlatformState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: (jpeg != null && jpeg!.isNotEmpty)
            ? Image.file(File(jpeg!))
            : const Text('No Image'),
      ),
    );
  }

  static var httpClient = HttpClient();
  Future<File> _downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    print('request-$request');
    var response = await request.close();
    print('response-$response');
    var bytes = await consolidateHttpClientResponseBytes(response);

    String dir = (await getTemporaryDirectory()).path;

    File file = File('$dir/$filename');

    await file.writeAsBytes(bytes);
    return file;
  }
}
