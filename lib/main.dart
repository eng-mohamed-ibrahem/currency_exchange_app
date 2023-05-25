import 'package:concurrency_exchange_app/controller/dio_helper.dart';
import 'package:concurrency_exchange_app/root/root_app.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const RootApp());
}
