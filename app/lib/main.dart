import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/playScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  );
  runApp(MaterialApp(home: PlayScreen()));
}
