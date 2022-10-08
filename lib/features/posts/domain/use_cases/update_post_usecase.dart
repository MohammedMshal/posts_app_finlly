import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/failures.dart';
import 'package:post_app_finaly/features/posts/domain/repository/base_posts_repository.dart';

import '../entities/posts.dart';

class UpdatePostUseCase extends BaseUseCases<Unit,UpdatePostParameters>{
  final BasePostsRepository basePostsRepository;

  UpdatePostUseCase({required this.basePostsRepository});

  @override
  Future<Either<Failures, Unit>> call(UpdatePostParameters parameters) async{
    return await basePostsRepository.updatePost();
  }
}
class UpdatePostParameters extends Equatable {
  final List<Posts> posts;

  const UpdatePostParameters(this.posts);

  @override
  List<Object> get props => [posts];
}