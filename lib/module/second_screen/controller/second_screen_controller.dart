import 'package:flutter/material.dart';
import 'package:tes_project/core.dart';
import 'package:tes_project/state_util.dart';
import '../../third_screen/model/user_model.dart';
import '../view/second_screen_view.dart';

class SecondScreenController extends State<SecondScreenView> {
  static late SecondScreenController instance;
  late SecondScreenView view;

  String selectedUsername = '';
  void fetchUsers(bool isLoading) {
    // Implementasi logika untuk mengambil data pengguna dari API
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    view = this.widget as SecondScreenView;
    return view.build(context, this);
  }

  doback() async {
    Get.offAll(FirstScreenView());
  }

  /* doback() async {
    Navigator.pop(context);
  } */

  void selectUser(String username) {
    setState(() {
      selectedUsername = username;
    });
  }

  void goToThirdScreenView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThirdScreenView(
          isLoading: true,
          userList: [],
        ),
      ),
    );
  }
}
