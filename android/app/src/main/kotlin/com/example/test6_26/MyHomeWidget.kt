package com.example.test6_26

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

/**
 * Implementation of App Widget functionality.
 */
class MyHomeWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.my_home_widget).apply {
                val title = widgetData.getString("shopping_widget_title", "购物车")
                val count = widgetData.getString("shopping_widget_cart_count", "0")
                val total = widgetData.getString("shopping_widget_cart_total", "¥0.00")
                val status = widgetData.getString("shopping_widget_status", "购物车为空")

                setTextViewText(R.id.widget_title, title)
                setTextViewText(R.id.widget_count, "$count 件商品")
                setTextViewText(R.id.widget_total, total)
                setTextViewText(R.id.text_id, status)

                val intent = Intent(context, MainActivity::class.java).apply {
                    action = "es.antonborri.home_widget.action.LAUNCH"
                    putExtra("source", "home_widget")
                    putExtra("action", "open_cart")
                }

                val pendingIntent = PendingIntent.getActivity(
                    context,
                    0,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )

                setOnClickPendingIntent(R.id.text_id, pendingIntent)
                setOnClickPendingIntent(R.id.widget_title, pendingIntent)
                setOnClickPendingIntent(R.id.widget_total, pendingIntent)
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
