import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:tapjoy/tapjoy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel("io.heybit.bitbunny/tapjoy");

  @override
  void initState() {
    super.initState();
    initPlatformState();
    getPlacement();
  }

  Future<void> initPlatformState() async {
    await platform.invokeMethod(
        'setUserId', {'userId': '16300b18-4cc1-4b50-b6a8-4895f6f41a91'});
    await platform.invokeMethod('connect', {
      'sdkKey': 'qcbUxWfZRzOsFK83SZ_STQECbMy4HXKM3Z8JeRuOhyD7wUfr7Rfm0r6NArGp'
    });

    if (!mounted) return;
  }

  Future<void> getPlacement() async {
    try {
      await platform.invokeMethod('getPlacement');
      print("Successfully created placement.");
    } on PlatformException catch (e) {
      print("Failed to show offers: '${e.message}'.");
    }
  }

  Future<void> showContent() async {
    try {
      await platform.invokeMethod('showContent');
      print("Successfully requested content.");
    } on PlatformException catch (e) {
      print("Failed to show offers: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tapjoy Plugin Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Tapjoy Plugin Example'),
              ElevatedButton(
                onPressed: getPlacement,
                child: const Text('getPlacement'),
              ),
              ElevatedButton(
                onPressed: showContent,
                child: const Text('requestContent'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
