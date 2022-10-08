import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/failures.dart';
import 'package:post_app_finaly/features/posts/domain/repository/base_posts_repository.dart';

class DeletePostUseCase extends BaseUseCases<Unit,DeletePostUseCase>{
  final BasePostsRepository basePostsRepository;

  DeletePostUseCase({required this.basePostsRepository});

  @override
  Future<Either<Failures, Unit>> call(DeletePostUseCase parameters) async{
    return await basePostsRepository.deletePost();
  }
}

class DeletePostParameters extends Equatable {
  final int postId;

  const DeletePostParameters({required this.postId});

  @override
  List<Object> get props => [postId];
}