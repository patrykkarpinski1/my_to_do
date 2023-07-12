import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  NoteModel(
    this.id,
    this.title,
    this.text,
  );

  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String text;
}
