import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/failures.dart';

import '../entities/posts.dart';
import '../repository/base_posts_repository.dart';

class AddPostUseCase extends BaseUseCases<Unit,AddPostParameters>{
  final BasePostsRepository basePostsRepository;

  AddPostUseCase({required this.basePostsRepository});
  @override
  Future<Either<Failures, Unit>> call(AddPostParameters parameters) async{
    return await basePostsRepository.addPost();
  }
}
class AddPostParameters extends Equatable {
  final List<Posts> posts;

  const AddPostParameters({required this.posts});

  @override
  List<Object> get props => [posts];
}