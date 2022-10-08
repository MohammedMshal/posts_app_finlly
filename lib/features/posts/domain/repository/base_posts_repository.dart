import 'package:dartz/dartz.dart';
import 'package:post_app_finaly/core/error/failures.dart';
import 'package:post_app_finaly/features/posts/domain/entities/posts.dart';

abstract class BasePostsRepository{
  Future<Either<Failures, List<Posts>>> getAllPosts();
  Future<Either<Failures, Unit>> addPost();
  Future<Either<Failures, Unit>> updatePost();
  Future<Either<Failures, Unit>> deletePost();
}