import 'package:demo/bloc/dress_bloc/dress_event.dart';
import 'package:demo/bloc/dress_bloc/dress_state.dart';
import 'package:demo/enums/enum.dart';
import 'package:demo/repository/dress_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DressBloc extends Bloc<DressEvent, DressState> {
  // creating new instance of the dress repo
  final DressRepository _dressRepository = DressRepository();
  DressBloc() : super(const DressState()) {
    on<FetchDress>(fetchDress);
    on<DeleteDress>(deleteDress);
  }

  // fetching the dress
  void fetchDress(FetchDress events, Emitter<DressState> emit) async {
    await _dressRepository
        .getDress()
        .then((data) {
          emit(
            state.copyWith(
              dress: data,
              message: "success",
              postStatus: PostStatus.success,
            ),
          );
        })
        .catchError((onError, StackTrace) {
          debugPrint(StackTrace);
          emit(
            state.copyWith(
              dress: null,
              message: onError,
              postStatus: PostStatus.failed,
            ),
          );
        });
  }

  void deleteDress(DeleteDress event, Emitter<DressState> emit) async {
    try {
      await _dressRepository.deleteDress(event.id);

      final dressList = List.of(state.dress)
        ..removeWhere((dress) => dress.sId.toString() == event.id.toString());

      emit(
        state.copyWith(
          message: "Deleted Successfully",
          postStatus: PostStatus.success,
          dress: dressList,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: "Error deleting the dress",
          postStatus: PostStatus.failed,
        ),
      );
    }
  }
}
