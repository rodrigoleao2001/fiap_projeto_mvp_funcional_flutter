package com.example.projeto_flutter_static_void

import androidx.multidex.MultiDexApplication
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}

class MyApplication: MultiDexApplication() {
    override fun onCreate() {
        super.onCreate()
    }
}
