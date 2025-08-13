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

  // for deleting the dress
  void deleteDress(DeleteDress event, Emitter<DressState> emit) async {
    await _dressRepository
        .deleteDress(event.id)
        .then((value) {
          emit(
            state.copyWith(
              dress: null,
              message: "success",
              postStatus: PostStatus.success,
            ),
          );
        })
        .catchError((onError) {
          emit(
            state.copyWith(
              dress: null,
              message: state.message,
              postStatus: PostStatus.failed,
            ),
          );
        });
  }
}
