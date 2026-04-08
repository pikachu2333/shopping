package com.example.test6_26

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "com.example/my_channel"
    private var pendingWidgetAction: String? = null
    private var methodChannel: MethodChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        methodChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "getInitialWidgetAction" -> {
                    val action = pendingWidgetAction
                    pendingWidgetAction = null
                    result.success(action)
                }

                else -> result.notImplemented()
            }
        }

        pendingWidgetAction = extractWidgetAction(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        val action = extractWidgetAction(intent)
        if (action != null) {
            pendingWidgetAction = action
            methodChannel?.invokeMethod("onWidgetAction", mapOf("action" to action))
        }
    }

    private fun extractWidgetAction(intent: Intent?): String? {
        if (intent == null) return null

        val source = intent.getStringExtra("source")
        val action = intent.getStringExtra("action")

        return if (source == "home_widget" && !action.isNullOrBlank()) action else null
    }
}
