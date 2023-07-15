import 'package:flutter/material.dart';
import 'package:tes_project/core.dart';
import 'package:tes_project/shared/widget/button/primary_button.dart';
import '../controller/second_screen_controller.dart';

class SecondScreenView extends StatefulWidget {
  final String eventName;
  const SecondScreenView({
    Key? key,
    required this.eventName,
  }) : super(key: key);

  Widget build(context, SecondScreenController controller) {
    controller.view = this;

    String selectedUsername = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SecondScreen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          onPressed: () => controller.doback(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18.0,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Nama Acara: $eventName",
              style: const TextStyle(fontSize: 16.0),
            ),
            Spacer(),
            Text(
              "Nama Pengguna Terpilih: $selectedUsername",
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: PrimaryButton(
                  label: "Chosse a User",
                  onPressed: () => controller.goToThirdScreenView()),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<SecondScreenView> createState() => SecondScreenController();
}
