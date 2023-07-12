import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_to_do/app/app.dart';
import 'package:my_to_do/app/core/config.dart';
import 'package:my_to_do/app/injection_container.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  Config.appFlavor = Flavor.production;
  runApp(const MyApp());
}
