import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:post_app_finaly/core/error/exceptions.dart';
import 'package:post_app_finaly/core/utils/app_strings.dart';
import 'package:post_app_finaly/features/posts/data/model/posts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePostsLocalDataSource {
  Future<Unit> cachedPost(CachedPostParameters parameters);

  Future<List<PostsModel>> getPost();
}

class PostLocalDataSource implements BasePostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSource({required this.sharedPreferences});

  @override
  Future<Unit> cachedPost(CachedPostParameters parameters) {
    //create var and convert json
    List postModelToJson = parameters.posts
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    //save var and encode
    sharedPreferences.setString(
        AppStrings.cachedPosts, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostsModel>> getPost() async {
    // get post in cache
    final String? getPost = sharedPreferences.getString(AppStrings.cachedPosts);
    if (getPost != null) {
      //decode data
      final decodePost = json.decode(getPost);
      //convert json to post model
      List<PostsModel> jsonToPostModel = decodePost.Map<PostsModel>(
          (jsonToModel) => PostsModel.fromJson(jsonToModel)).toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException(message: AppStrings.emptyMessage);
    }
  }
}

class CachedPostParameters extends Equatable {
  final List<PostsModel> posts;

  const CachedPostParameters({required this.posts});

  @override
  List<Object> get props => [posts];
}
