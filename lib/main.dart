import 'package:flutter/material.dart';
import 'app.dart';
import 'services/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDB.initDB();
  runApp(LearnAndConnectApp());
}
