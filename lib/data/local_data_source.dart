import 'package:hive/hive.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:uuid/uuid.dart';

class LocalDataSource {
  Stream<List<NoteModel>> getNotesStream() {
    final box = Hive.box<NoteModel>('notes');
    return Stream.value(box.values.toList());
  }

  Future<String> addNote(String text, String title) async {
    var uuid = const Uuid();
    String id = uuid.v1();
    var box = Hive.box<NoteModel>('notes');
    NoteModel note = NoteModel(id, title, text);
    await box.put(id, note);
    return id;
  }

  Future<void> deleteNote({required String id}) async {
    final box = Hive.box<NoteModel>('notes');
    await box.delete(id);
  }

  Future<NoteModel> getNoteById({required String id}) async {
    final box = Hive.box<NoteModel>('notes');
    final note = box.get(id);
    return note!;
  }
}
