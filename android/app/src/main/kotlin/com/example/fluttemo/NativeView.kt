package com.example.fluttemo

import android.content.Context
import android.graphics.Color
import android.view.View
import android.webkit.WebView
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView


internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val webview: WebView

    override fun getView(): View {
        return webview
    }

    override fun dispose() {}

    init {
        webview = WebView(context)
        webview.setBackgroundColor(Color.rgb(255, 255, 255))
        webview.importantForAccessibility = View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS
        webview.loadData("<html><body>Android native webview</body></html>", "text/html", "UTF-8")
    }
}
