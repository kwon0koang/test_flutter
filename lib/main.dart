import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_counter/getx_counter.dart';
import 'package:test_flutter/src/pages/getx_counter_service/getx_static_counter.dart';
import 'package:test_flutter/src/pages/getx_mvvm/getx_mvvm.dart';
import 'package:test_flutter/src/pages/getx_mvvm2/getx_mvvm2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(GetXCounter());
                },
                child: Text("Test GetX counter"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(GetXStaticCounter());
                },
                child: Text("Test GetX service"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(GetXMvvm());
                },
                child: Text("Test GetX mvvm"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(GetXMvvm2());
                },
                child: Text("Test GetX mvvm 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  // todo kyk
                },
                child: Text("Test GetX pattern"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
