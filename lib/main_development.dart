import 'package:flutter/material.dart';
import 'package:my_to_do/app/app.dart';
import 'package:my_to_do/app/core/config.dart';
import 'package:my_to_do/app/injection_container.dart';

void main() {
  Config.appFlavor = Flavor.development;
  configureDependencies();
  runApp(const MyApp());
}
