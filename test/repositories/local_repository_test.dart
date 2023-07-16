import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_to_do/data/local_data_source.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:my_to_do/repositories/local_repository.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  late LocalRepository sut;
  late LocalDataSource dataSource;
  setUp(() {
    dataSource = MockLocalDataSource();
    sut = LocalRepository(localDataSources: dataSource);
  });
  group('addNote', () {
    const mockText = 'text';
    const mockTitle = 'title';
    const mockId = '1';

    test('should call localDataSources.addNote() method with correct arguments',
        () async {
      final expectedArguments = [
        mockText,
        mockTitle,
      ];
      // 1
      when(() => dataSource.addNote(any(), any()))
          .thenAnswer((_) async => mockId);
      // 2
      await sut.addNote(
        mockText,
        mockTitle,
      );
      // 3
      verify(() => dataSource.addNote(
            expectedArguments[0],
            expectedArguments[1],
          )).called(1);
    });
  });
  group('deleteNote', () {
    test(
        'should call localDataSources.deleteNote() method with correct argument',
        () async {
      const mockNoteId = '12';
      // 1
      when(() => dataSource.deleteNote(id: any(named: 'id')))
          .thenAnswer((_) => Future.value());
      // 2
      await sut.deleteNote(id: mockNoteId);
      // 3
      verify(() => dataSource.deleteNote(id: mockNoteId)).called(1);
    });
  });
  group('getNotesStream', () {
    test('should call localDataSources.getNotesStream() method', () {
      //1
      when(() => dataSource.getNotesStream())
          .thenAnswer((_) => Stream.value([]));
      //2
      sut.getNotesStream();
      //3
      verify(() => dataSource.getNotesStream()).called(1);
    });

    test('should emit correct values', () async {
      final mockNotes = [
        NoteModel('1', 'title1', 'text1'),
        NoteModel('2', 'title2', 'text2'),
        NoteModel('3', 'title3', 'text3'),
      ];
      //1
      when(() => dataSource.getNotesStream())
          .thenAnswer((_) => Stream.value(mockNotes));
      //2
      final stream = sut.getNotesStream();
      //3
      expect(stream, emitsInOrder([mockNotes]));
    });
  });
  group('getDetalisNote', () {
    test(
        'should call localDataSources.getNoteById(id) method and return correct note',
        () async {
      final mockNote = NoteModel('1', 'title1', 'text1');
      // 1
      when(() => dataSource.getNoteById(id: '1'))
          .thenAnswer((_) async => mockNote);
      // 2
      final result = await sut.getDetalisNote(id: '1');
      // 3
      verify(() => dataSource.getNoteById(id: '1'));
      // 4
      expect(result, equals(mockNote));
    });
  });
}
