import 'package:hive/hive.dart';
import 'package:my_to_do/models/note_model.dart';

class LocalDataSource {
  Stream<List<NoteModel>> getNotesStream() {
    final box = Hive.box<NoteModel>('notes');
    return Stream.value(box.values.toList());
  }

  Future<int> addNote(String text, String title) async {
    final box = Hive.box<NoteModel>('notes');
    final note = NoteModel(box.length, title, text);
    final id = await box.add(note);
    return id;
  }

  Future<void> deleteNote({required int id}) async {
    final box = Hive.box<NoteModel>('notes');
    await box.delete(id);
  }

  Future<NoteModel> getNoteById({required int id}) async {
    final box = Hive.box<NoteModel>('notes');
    final note = box.get(id);
    return note!;
  }
}
