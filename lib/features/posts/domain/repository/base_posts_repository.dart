import 'package:dartz/dartz.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/failures.dart';
import 'package:post_app_finaly/features/posts/domain/entities/posts.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/delete_post_usecase.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/update_post_usecase.dart';

import '../use_cases/add_post_usecase.dart';

abstract class BasePostsRepository{
  Future<Either<Failures, List<Posts>>> getAllPosts(NoParameters parameters);
  Future<Either<Failures, Unit>> addPost(AddPostParameters parameters);
  Future<Either<Failures, Unit>> updatePost(UpdatePostParameters parameters);
  Future<Either<Failures, Unit>> deletePost(DeletePostParameters parameters);
}