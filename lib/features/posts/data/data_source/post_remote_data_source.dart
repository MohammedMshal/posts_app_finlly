import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_app_finaly/core/base_usecase/base_usecases.dart';
import 'package:post_app_finaly/core/error/exceptions.dart';
import 'package:post_app_finaly/core/utils/app_strings.dart';
import 'package:post_app_finaly/features/posts/data/model/posts_model.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/add_post_usecase.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/delete_post_usecase.dart';
import 'package:post_app_finaly/features/posts/domain/use_cases/update_post_usecase.dart';

abstract class BasePostRemoteDataSource {
  Future<List<PostsModel>> getAllPosts(NoParameters parameters);

  Future<Unit> addPost(AddPostParameters parameters);

  Future<Unit> updatePost(UpdatePostParameters parameters);

  Future<Unit> deletePost(DeletePostParameters parameters);
}

class PostRemoteDataSource implements BasePostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource({required this.dio});

  @override
  Future<List<PostsModel>> getAllPosts(NoParameters parameters) async {
    final Response response = await dio.get(AppStrings.postsUrl, options: Options(
      headers: AppStrings.headersApi,
    ));
    if (response.statusCode == 200) {
      return List<PostsModel>.from(
          (response.data as List).map((e) => PostsModel.fromJson(e)));
    } else {
      throw ServerException(message: AppStrings.getAllPostsMessage);
    }
  }

  @override
  Future<Unit> addPost(AddPostParameters parameters) async{
    final Map<String, dynamic> body = {
      'title': parameters.posts.title,
      'body': parameters.posts.body,
    };
    final Response response = await dio.post(
      AppStrings.postsUrl,
      data: body,
    );
    if(response.statusCode == 201){
      return Future.value(unit);
    }else{
      throw ServerException(message: AppStrings.addPostMessage);
    }
  }

  @override
  Future<Unit> updatePost(UpdatePostParameters parameters) async{
    final Map<String, dynamic> data = {
      'title':parameters.posts.title,
      'body':parameters.posts.body,
    };
    final String postId = parameters.posts.id.toString();
    final Response response = await dio.patch(AppStrings.postsUrl + postId,data:data );
    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException(message: AppStrings.updatePostMessage,);
    }
  }

  @override
  Future<Unit> deletePost(DeletePostParameters parameters) async{

    final Response response = await dio.delete(AppStrings.postsUrl + parameters.postId.toString());
    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException(message: AppStrings.deletePostMessage);
    }
  }

}