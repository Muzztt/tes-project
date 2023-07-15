import 'package:flutter/material.dart';
import 'package:tes_project/core.dart';
import '../controller/screen_controller.dart';

class ScreenView extends StatefulWidget {
  const ScreenView({Key? key}) : super(key: key);

  Widget build(context, ScreenController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ScreenView> createState() => ScreenController();
}
