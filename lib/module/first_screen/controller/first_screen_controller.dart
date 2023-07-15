import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tes_project/core.dart';
import 'package:tes_project/state_util.dart';
import '../view/first_screen_view.dart';

List<String> palindromeText = ['kakak', 'katak', 'makam', 'ayah', 'baba'];

class FirstScreenController extends State<FirstScreenView> {
  static late FirstScreenController instance;
  late FirstScreenView view;
  late String sequence;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool isPalindrome(String word) {
    String cleanWord = word.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
    String reversedWord = cleanWord.split('').reversed.join('');
    return cleanWord == reversedWord;
  }

  void checkPalindrome(BuildContext context, String inputWord) {
    bool isPalindromeResult = isPalindrome(inputWord);

    String message = isPalindromeResult ? 'isPalindrome' : 'bukan palindrom';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Palindrome Check'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  donext() async {
    Get.offAll(const SecondScreenView(
      eventName: '',
    ));
  }
}
