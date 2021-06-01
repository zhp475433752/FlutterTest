package com.example.fluttertest

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry


/**
 * Created by zhanghuipeng on 5/31/21.
 */
class FlutterPluginSendToAct(private val activity: Activity):MethodChannel.MethodCallHandler {

    companion object{
        const val CHANNEL = "samples.flutter.io/battery"
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), CHANNEL);
            val instance =  FlutterPluginSendToAct(registrar.activity());
            //setMethodCallHandler在此通道上接收方法调用的回调
            channel.setMethodCallHandler(instance);
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method.equals("getBatteryLevel")) {
            val batteryLevel = getBatteryLevel()

            if (batteryLevel != -1) {
                result.success(batteryLevel)
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null)
            }
        } else {
            result.notImplemented()
        }
    }

    private fun getBatteryLevel(): Int {
        var batteryLevel = -1
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = activity.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(activity.applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }

        return batteryLevel
    }
}