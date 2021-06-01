package com.example.fluttertest

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {

//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        // 隐藏状态栏不占位
//        window.setFlags(
//                WindowManager.LayoutParams.FLAG_FULLSCREEN,
//                WindowManager.LayoutParams.FLAG_FULLSCREEN)
//        window.decorView.setPadding(0,0,0,0)
//        window.decorView.setBackgroundColor(Color.WHITE)
//        val layoutParams = window.attributes
//        layoutParams.width = WindowManager.LayoutParams.MATCH_PARENT
//        layoutParams.height = WindowManager.LayoutParams.MATCH_PARENT
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
//            // 延伸显示区域到刘海
//            val attributes = window.attributes
//            attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
//            window.attributes = attributes
//            // 设置全屏显示
//            window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
//        }
//        window.attributes = layoutParams
//    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val shimPluginRegistry = ShimPluginRegistry(flutterEngine)
        FlutterPluginSendToAct.registerWith(shimPluginRegistry.registrarFor(FlutterPluginSendToAct.CHANNEL));
    }

}


