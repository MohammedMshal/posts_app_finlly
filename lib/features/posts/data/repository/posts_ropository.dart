import 'package:dartz/dartz.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/failures.dart';
import 'package:post_app_finaly/core/inernet_checker/interner_checker.dart';
import 'package:post_app_finaly/core/utils/app_strings.dart';
import 'package:post_app_finaly/features/posts/data/data_source/post_local_data_source.dart';
import 'package:post_app_finaly/features/posts/data/data_source/post_remote_data_source.dart';
import 'package:post_app_finaly/features/posts/data/model/posts_model.dart';
import 'package:post_app_finaly/features/posts/domain/entities/posts.dart';
import 'package:post_app_finaly/features/posts/domain/repository/base_posts_repository.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/add_post_usecase.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/delete_post_usecase.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/update_post_usecase.dart';

import '../../../../core/error/exceptions.dart';

class PostsRepository implements BasePostsRepository {
  final BasePostRemoteDataSource basePostRemoteDataSource;
  final BasePostsLocalDataSource basePostsLocalDataSource;
  final BaseInternetChecker baseInternetChecker;

  PostsRepository({
    required this.basePostRemoteDataSource,
    required this.basePostsLocalDataSource,
    required this.baseInternetChecker,
  });

  @override
  Future<Either<Failures, List<Posts>>> getAllPosts(
      NoParameters parameters) async {
    if (await baseInternetChecker.isConnected) {
      try {
        final remoteDataPost =
            await basePostRemoteDataSource.getAllPosts(const NoParameters());
        basePostsLocalDataSource
            .cachedPost(CachedPostParameters(posts: remoteDataPost));
        return Right(remoteDataPost);
      } on ServerException {
        return Left(ServerFailure(message: AppStrings.getAllPostsMessage));
      }
    } else {
      try {
        final localDataPost = await basePostsLocalDataSource.getPost();
        return Right(localDataPost);
      } on EmptyCacheException {
        return left(EmptyCacheFailure(message: AppStrings.emptyMessage));
      }
    }
  }

  @override
  Future<Either<Failures, Unit>> addPost(AddPostParameters parameters) async {
    final PostsModel postsModel = PostsModel(
      title: parameters.posts.title,
      body: parameters.posts.body,
    );

    try {
      if (await baseInternetChecker.isConnected) {
        await basePostRemoteDataSource.addPost(AddPostParameters(posts: postsModel));
        return const Right(unit);
      } else {
        return left(ServerFailure(message: AppStrings.addPostMessage));
      }
    } on ServerException {
      return Left(OfflineFailure(message: AppStrings.emptyMessage));
    }
  }
  
  @override
  Future<Either<Failures, Unit>> updatePost(UpdatePostParameters parameters) async{
    final PostsModel postsModel = PostsModel(title: parameters.posts.title, body: parameters.posts.body,);
    if(await baseInternetChecker.isConnected){
      try{
        await basePostRemoteDataSource.updatePost(UpdatePostParameters(postsModel));
        return const Right(unit);
      }on ServerException{
        throw ServerFailure(message: AppStrings.updatePostMessage);
      }
    }else{
      return Left(OfflineFailure(message: AppStrings.emptyMessage));
    }
  }

  @override
  Future<Either<Failures, Unit>> deletePost(DeletePostParameters parameters) async{
    if(await baseInternetChecker.isConnected){
      try{
        await basePostRemoteDataSource.deletePost(DeletePostParameters(postId: parameters.postId));
        return const Right(unit);
      }on ServerException{
        throw ServerFailure(message: AppStrings.deletePostMessage);
      }
    }else{
      return Left(OfflineFailure(message: AppStrings.emptyMessage));
    }
  }
}



