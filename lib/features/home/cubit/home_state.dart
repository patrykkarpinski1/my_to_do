part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {@Default([]) List<NoteModel> notes,
      NoteModel? noteModel,
      @Default(Status.initial) Status status,
      String? errorMessage,
      @Default(false) bool saved}) = _HomeState;
}
