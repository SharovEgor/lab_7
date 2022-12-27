class Post {

  final int? _id;
  final String? _title;
  final String? _imgURL;


  int? get id => _id;
  String? get title => _title;
  String? get imgURL => _imgURL;

  Post.fromJson(Map<String, dynamic> json) :
        this._id = json["id"],
        this._title = json["title"],
        this._imgURL = json["url"];
}

// PostList являются оберткой для массива постов
class PostList {
  final List<Post> posts = [];
  PostList.fromJson(List<dynamic> jsonItems) {
    for (var jsonItem in jsonItems) {
      posts.add(Post.fromJson(jsonItem));
    }
  }
}

// наше представление будет получать объекты
// этого класса и определять конкретный его
// подтип
abstract class PostResult {}

// указывает на успешный запрос
class PostResultSuccess extends PostResult {
  final PostList postList;
  PostResultSuccess(this.postList);
}

// произошла ошибка
class PostResultFailure extends PostResult {
  final String error;
  PostResultFailure(this.error);
}

// загрузка данных
class PostResultLoading extends PostResult {
  PostResultLoading();
}