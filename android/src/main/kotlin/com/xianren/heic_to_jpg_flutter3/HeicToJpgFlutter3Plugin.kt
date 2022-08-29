package com.xianren.heic_to_jpg_flutter3

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Handler
import android.os.Looper

import io.flutter.plugin.common.PluginRegistry.Registrar

/** HeicToJpgFlutter3Plugin */
class HeicToJpgFlutter3Plugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "heic_to_jpg_flutter3")
    channel.setMethodCallHandler(this)
  }

  companion object {
    var applicationContext: Context? = null
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "heic_to_jpg_flutter3")
      channel.setMethodCallHandler(HeicToJpgFlutter3Plugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "convert") {
      if (call.hasArgument("heicPath") && !call.argument<String>("heicPath").isNullOrEmpty()) {
        val handler = Handler(Looper.getMainLooper())
        Thread {
          var jpgPath = call.argument<String>("jpgPath")
          if(jpgPath.isNullOrEmpty()){
            jpgPath = "${applicationContext?.cacheDir}/${System.currentTimeMillis()}.jpg"
          }
          val output = convertHeicToJpeg(call.argument<String>("heicPath")!!, jpgPath)
          handler.post {
            if (output != null) {
              result.success(output)
            } else {
              result.error("error", "output path is null", null)
            }
          }
        }.start()
        return
      }
      result.error("illegalArgument", "heicPath is null or Empty.", null)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
