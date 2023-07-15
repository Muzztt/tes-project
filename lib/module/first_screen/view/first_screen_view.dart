import 'package:flutter/material.dart';
import 'package:tes_project/core.dart';
import 'package:tes_project/state_util.dart';
import '../../../shared/widget/button/primary_button.dart';
import '../../../shared/widget/form/textfield/textfield.dart';
import '../controller/first_screen_controller.dart';

class FirstScreenView extends StatefulWidget {
  const FirstScreenView({Key? key}) : super(key: key);

  Widget build(context, FirstScreenController controller) {
    controller.view = this;

    TextEditingController palindromeController =
        TextEditingController(); // Step 1

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_tes.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  CircleAvatar(
                    radius: 48,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo_suitmedia.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            32.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: QTextField(
                      label: "Name",
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  QTextField(
                    label: "Palindrome",
                    onChanged: (value) {
                      bool result = controller.isPalindrome(value);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    label: "Check",
                    onPressed: () {
                      String inputWord = palindromeController.text;
                      controller.checkPalindrome(context, inputWord);
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  PrimaryButton(
                    label: "Next",
                    onPressed: () => controller.donext(),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<FirstScreenView> createState() => FirstScreenController();
}
