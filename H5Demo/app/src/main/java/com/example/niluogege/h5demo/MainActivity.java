package com.example.niluogege.h5demo;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.SslErrorHandler;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;

import io.flutter.facade.Flutter;
import io.flutter.view.FlutterView;

public class MainActivity extends AppCompatActivity {

    private WebView mWebView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        findViewById(R.id.btn).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FlutterView flutterView = Flutter.createView(MainActivity.this, getLifecycle(), "route1");
                addContentView(flutterView, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT
                        , ViewGroup.LayoutParams.MATCH_PARENT));

            }
        });

        findViewById(R.id.btn_2).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });
//        mWebView = findViewById(R.id.wv);
//        setWebView();
    }

    private void finishPage() {
//        if (mWebView != null && mWebView.canGoBack()) {
//            mWebView.goBack();
//        } else {
//            finish();
//        }

        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("wacai://http://test3.mm.t.xianghuanji.com/payf/return?shortCode=64cce7ea5de38daf0eb455a48b74c898"));
        startActivity(intent);
    }

    private void setWebView() {

        settingWebView();
        mWebView.setWebViewClient(webViewClient);
//        mWebView.setWebChromeClient(webChromeClient);
        // 通过addJavascriptInterface()将Java对象映射到JS对象
        //参数1：Javascript对象名
        //参数2：Java对象名
//        mWebView.addJavascriptInterface(new AndroidJs(this, mTitleTV), "jsObj");
//        mWebView.loadUrl("http://test3.mm.t.xianghuanji.com/?utm_source=wacaiapp");
        mWebView.loadUrl("http://test3.mm.t.xianghuanji.com/?utm_source=wacaiapp&utm_medium=wacaiapp&utm_campaign=wacaiapp");
//        mWebView.loadUrl("file:///android_asset/click.html");
    }

    private void settingWebView() {
        WebSettings settings = mWebView.getSettings();
        settings.setDatabaseEnabled(true);

        if (this.getApplicationContext().getDir("database", Context.MODE_PRIVATE) != null) {
            String dir = this.getApplicationContext().getDir("database", Context.MODE_PRIVATE).getPath();
            settings.setGeolocationDatabasePath(dir);
        }

        settings.setGeolocationEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setSavePassword(false);//不存储密码
        // 设置是否允许 WebView 使用 File 协议 ,默认设置为true，即允许在 File 域下执行任意 JavaScript 代码但是存在漏洞，设置为false 就不能加载本地html
//        settings.setAllowFileAccess(true);

        settings.setJavaScriptEnabled(true);
        String ua = settings.getUserAgentString();
        settings.setUserAgentString(ua + ";Android;wacai://exchange");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            settings.setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);
        }
    }

    public static String getVersionName(Context context) {
        PackageInfo packageInfo = null;
        try {
            packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        return packageInfo.versionName;
    }

    /**
     * WebViewClient 监听
     */
    WebViewClient webViewClient = new WebViewClient() {

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String u) {
            view.loadUrl(u);
            return true;

        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            super.onPageStarted(view, url, favicon);
        }

        @Override
        public void onPageFinished(WebView view, String url) {
            super.onPageFinished(view, url);

        }

        @Override
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            super.onReceivedError(view, errorCode, description, failingUrl);
        }

        @Override
        public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
            handler.proceed();
        }
    };
}
