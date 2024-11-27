import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sib_app/data/model/comment.dart';
import 'package:sib_app/data/repository/comment_repository.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  ICommentRepository repository;
  CommentBloc(this.repository) : super(CommentLoading()) {
    on<CommentInitilzeEvent>((event, emit) async {
      final response = await repository.getComments(event.productID);
      emit(CommentResponse(response));
    });

    on<CommentPostEvent>((event, emit) async {
      emit(CommentLoading());
      await repository.postComment(event.productId, event.comment);
      final response = await repository.getComments(event.productId);
      emit(CommentResponse(response));
    });
  }
}
