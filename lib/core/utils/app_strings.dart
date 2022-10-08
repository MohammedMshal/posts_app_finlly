class AppStrings {
 static const String titleApp = 'Posts App';
  static const String titleEditeScreen = 'Edite Post';
  static const String titleAddScreen = 'add Post';
  static const String titleDetailsScreen = 'Details Post';
  static const String editButton = 'Edit';
  static const String deleteButton = 'Delete';

  //cached shard preferences
  static const String cachedPosts = 'CachedPosts';

  //api strings
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String postsUrl = "https://jsonplaceholder.typicode.com/posts/";
  static void postsUpdateOrDeleteUrl(int id) {
   "https://jsonplaceholder.typicode.com/posts/$id";
  }
  static const Map<String, String> headersApi = {
    "Content-Type": "application/json"
  };

  static String deletePostsUrl({required int id}) =>
      "https://jsonplaceholder.typicode.com/posts/$id";

  //message app
  static String emptyMessage = 'No Data!, please turn on internet';
  static String getAllPostsMessage = 'get all posts error!!!';
  static String addPostMessage = 'Add post error!!!';
  static String updatePostMessage = 'update post error!!!';
  static String deletePostMessage = 'delete post error!!!';
}