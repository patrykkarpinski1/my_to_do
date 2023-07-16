import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_to_do/app/core/enums.dart';
import 'package:my_to_do/features/home/cubit/home_cubit.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:my_to_do/repositories/local_repository.dart';

class MockLocalRepository extends Mock implements LocalRepository {}

void main() {
  late HomeCubit sut;
  late LocalRepository localRepository;
  final mockNotes = [
    NoteModel('1', 'title1', 'text1'),
    NoteModel('2', 'title2', 'text2'),
    NoteModel('3', 'title3', 'text3'),
  ];

  setUp(() {
    localRepository = MockLocalRepository();
    sut = HomeCubit(localRepository: localRepository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => localRepository.getNotesStream())
            .thenAnswer((_) => Stream.value(mockNotes));
      });

      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.success with results',
        build: () => HomeCubit(localRepository: localRepository),
        act: (cubit) => cubit.start(),
        expect: () => [
          const HomeState(
            status: Status.loading,
          ),
          HomeState(
            status: Status.success,
            notes: mockNotes,
          ),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => localRepository.getNotesStream())
            .thenAnswer((_) => Stream.error('error: error'));
      });

      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.error with error message',
        build: () => HomeCubit(localRepository: localRepository),
        act: (cubit) => cubit.start(),
        expect: () => [
          const HomeState(
            status: Status.loading,
          ),
          const HomeState(
            status: Status.error,
            errorMessage: 'error: error',
          ),
        ],
      );
    });
  });

  group('addNote', () {
    group('success', () {
      const noteId = 'note';
      const title = 'title';
      const text = 'text';
      final expectedNoteModel = NoteModel(noteId, title, text);
      setUp(() {
        when(() => localRepository.addNote(text, title))
            .thenAnswer((_) async => noteId);
      });
      blocTest<HomeCubit, HomeState>(
        'emits saved: true and noteModel with expected values',
        build: () => sut,
        act: (cubit) => cubit.add(text, title),
        expect: () => [
          HomeState(
              saved: true,
              notes: [],
              noteModel: expectedNoteModel,
              status: Status.initial,
              errorMessage: null),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => localRepository.addNote('text', 'title'))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<HomeCubit, HomeState>(
        'emits Status.error when saved fails',
        build: () => sut,
        act: (cubit) => cubit.add('text', 'title'),
        expect: () => [
          const HomeState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
  group('getNoteWithID', () {
    group('success', () {
      setUp(() {
        when(() => localRepository.getDetalisNote(id: '1')).thenAnswer(
          (_) async => NoteModel('1', 'title1', 'text1'),
        );
      });
      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.getNoteWithID('1'),
        expect: () => [
          const HomeState(
            status: Status.loading,
            noteModel: null,
          ),
          HomeState(
            status: Status.success,
            noteModel: NoteModel('1', 'title1', 'text1'),
          )
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => localRepository.getDetalisNote(id: '1'))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.getNoteWithID('1'),
        expect: () => [
          const HomeState(
            status: Status.loading,
            noteModel: null,
          ),
          const HomeState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
        ],
      );
    });
  });
  group('deleteNote', () {
    group('success', () {
      setUp(() {
        when(() => localRepository.deleteNote(id: '1'))
            .thenAnswer((_) async => []);
        when(() => localRepository.getNotesStream())
            .thenAnswer((_) => Stream.value(mockNotes));
      });
      blocTest<HomeCubit, HomeState>(
        'deletes a note with the specified id',
        build: () => sut,
        act: (cubit) => cubit.remove(documentID: '1'),
        expect: () => [
          const HomeState(
            status: Status.loading,
          ),
          HomeState(
            status: Status.success,
            notes: mockNotes,
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => localRepository.deleteNote(id: '1'))
            .thenThrow(Exception('test-exception-error'));
        when(() => localRepository.getNotesStream())
            .thenAnswer((_) => Stream.value(mockNotes));
      });
      blocTest<HomeCubit, HomeState>(
        'emits Status.error with an error message when deletion fails',
        build: () => sut,
        act: (cubit) => cubit.remove(documentID: '1'),
        expect: () => [
          const HomeState(
              status: Status.error,
              errorMessage: 'Exception: test-exception-error'),
          const HomeState(
            status: Status.loading,
          ),
          HomeState(
            status: Status.success,
            notes: mockNotes,
          ),
        ],
      );
    });
  });
}
