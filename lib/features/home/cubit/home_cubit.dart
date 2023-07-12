import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_to_do/app/core/enums.dart';
import 'package:my_to_do/models/note_model.dart';
import 'package:my_to_do/repositories/local_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.localRepository}) : super(const HomeState());

  final LocalRepository localRepository;
  StreamSubscription? _streamSubscription;
  Future<void> start() async {
    emit(const HomeState(status: Status.loading));
    _streamSubscription = localRepository.getNotesStream().listen(
      (notes) {
        emit(
          state.copyWith(
            status: Status.success,
            notes: notes,
          ),
        );
      },
    )..onError(
        (error) {
          {
            emit(
              state.copyWith(
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          }
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> remove({required int documentID}) async {
    try {
      await localRepository.deleteNote(id: documentID);
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  Future<void> add(String text, String title) async {
    try {
      final id = await localRepository.addNote(text, title);
      emit(
        state.copyWith(saved: true, noteModel: NoteModel(id, title, text)),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getNoteWithID(int id) async {
    emit(
      const HomeState(status: Status.loading, noteModel: null),
    );
    try {
      final note = await localRepository.getDetalisNote(id: id);
      emit(state.copyWith(status: Status.success, noteModel: note));
    } catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          errorMessage: error.toString(),
          noteModel: null,
        ),
      );
    }
  }
}
