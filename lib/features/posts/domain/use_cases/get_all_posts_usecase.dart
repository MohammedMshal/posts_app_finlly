import 'package:dartz/dartz.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/failures.dart';
import 'package:post_app_finaly/features/posts/domain/repository/base_posts_repository.dart';

import '../entities/posts.dart';

class GetAllPostsUseCase extends BaseUseCases<List<Posts>,NoParameters> {
  final BasePostsRepository basePostsRepository;

  GetAllPostsUseCase({required this.basePostsRepository});
  @override
  Future<Either<Failures, List<Posts>>> call(NoParameters parameters) async{
    return await basePostsRepository.getAllPosts();
  }
}

