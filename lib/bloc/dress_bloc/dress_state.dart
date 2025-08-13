import 'package:demo/data/model/dress_model.dart';
import 'package:demo/enums/enum.dart';
import 'package:equatable/equatable.dart';

class DressState extends Equatable {
  final PostStatus postStatus;
  final List<DressModel> dress;
  final String message;
  const DressState({
    // initial state
    this.postStatus = PostStatus.loading,
    this.dress = const <DressModel>[],
    this.message = "",
  });

  DressState copyWith({
    PostStatus? postStatus,
    String? message,
    List<DressModel>? dress,
  }) {
    return DressState(
      dress: dress ?? this.dress,
      message: message ?? this.message,
      postStatus: postStatus ?? this.postStatus,
    );
  }

  @override
  List<Object?> get props => [message, dress, postStatus];
}
