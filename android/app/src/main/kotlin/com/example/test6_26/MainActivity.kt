package com.example.test6_26

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example/my_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        startActivity(intent)
        // 设置平台通道，监听来自 Flutter 的方法调用
        MethodChannel(flutterEngine!!.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openAppWithExtras") {
                val message = call.argument<String>("message") ?: "默认消息"
                openAppWithExtras(message)
                result.success("Intent opened successfully")
            } else {
                result.notImplemented()
            }
        }
    }

    // 从 Flutter 打开带有附加数据的 Intent
    private fun openAppWithExtras(message: String?) {
        val intent = Intent(this, MainActivity::class.java)
        val bundle = Bundle()
        bundle.putString("message", message)
        intent.putExtras(bundle)
        startActivity(intent)

        // 显示一个 Toast，带有消息内容
        Toast.makeText(this, "Opening App with message: $message", Toast.LENGTH_SHORT).show()
    }
}
