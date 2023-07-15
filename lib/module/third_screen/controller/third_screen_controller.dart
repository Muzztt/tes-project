import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core.dart';
import '../model/user_model.dart';

class ThirdScreenController extends StatefulWidget {
  static late SecondScreenController secondScreenController;

  @override
  State<ThirdScreenController> createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreenController> {
  List<User> userList = [];
  bool isLoading = false;
  int currentPage = 1;

  @override
  void initState() {
    ThirdScreenController.secondScreenController =
        SecondScreenController.instance;
    fetchUsers();
    super.initState();
  }

  Future<void> fetchUsers() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    final url = 'https://reqres.in/api/users?page=$currentPage&per_page=10';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final users = data['data'];

      setState(() {
        for (var user in users) {
          userList.add(User.fromJson(user));
        }
        currentPage++;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  List users = [];
  getProducts() async {
    var response = await Dio().get(
      "https://reqres.in/api/users?page=$currentPage&per_page=10",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    users = obj["data"];
    setState(() {});
  }

  void selectUser(User user) {
    ThirdScreenController.secondScreenController
        .selectUser('${user.firstName} ${user.lastName}');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ThirdScreenView(
      userList: userList,
      isLoading: isLoading,
    );
  }
}
