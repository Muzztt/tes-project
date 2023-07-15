import 'package:flutter/material.dart';
import 'package:tes_project/state_util.dart';
import '../view/screen_view.dart';

class ScreenController extends State<ScreenView> {
  static late ScreenController instance;
  late ScreenView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
