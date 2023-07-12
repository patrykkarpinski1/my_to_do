import 'package:my_to_do/data/local_data_source.dart';
import 'package:my_to_do/models/note_model.dart';

class LocalRepository {
  LocalRepository({required this.localDataSources});
  final LocalDataSource localDataSources;

  Future<int> addNote(String text, String title) async {
    final id = await localDataSources.addNote(text, title);
    return id;
  }

  Future<void> deleteNote({required int id}) {
    return localDataSources.deleteNote(id: id);
  }

  Stream<List<NoteModel>> getNotesStream() {
    return localDataSources.getNotesStream();
  }

  Future<NoteModel> getDetalisNote({required int id}) async {
    return localDataSources.getNoteById(id: id);
  }
}
