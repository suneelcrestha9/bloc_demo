import 'package:demo/data/model/dress_model.dart';
import 'package:equatable/equatable.dart';

abstract class DressEvent extends Equatable {
  const DressEvent();

  @override
  List<Object?> get props => [];
}

// event for fetching the dress
class FetchDress extends DressEvent {}

// event for posting the dress
class PostDress extends DressEvent {
  final DressModel dress;
  const PostDress({required this.dress});

  @override
  List<Object?> get props => [dress];
}

// event for deleting the item
class DeleteDress extends DressEvent {
  final String id;
  const DeleteDress({required this.id});

  @override
  List<Object?> get props => [id];
}
