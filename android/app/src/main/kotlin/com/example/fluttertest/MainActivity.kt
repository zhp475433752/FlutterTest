package com.example.fluttertest

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val shimPluginRegistry = ShimPluginRegistry(flutterEngine)
        FlutterPluginSendToAct.registerWith(shimPluginRegistry.registrarFor(FlutterPluginSendToAct.CHANNEL));
    }

}


