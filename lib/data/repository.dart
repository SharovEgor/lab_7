import 'dart:convert';

// импортируем http пакет
import 'package:http/http.dart' as http;

import '../models/post.dart';
const String SERVER = "https://jsonplaceholder.typicode.com";

class Repository {
  // обработку ошибок мы сделаем в контроллере
  // мы возвращаем Future объект, потому что
  // fetchPhotos асинхронная функция
  // асинхронные функции не блокируют UI
  Future<PostList> fetchPosts() async {
    // сначала создаем URL, по которому
    // мы будем делать запрос
    final url = Uri.parse("$SERVER/photos");
    // делаем GET запрос
    final response = await http.get(url);
// проверяем статус ответа
    if (response.statusCode == 200) {
      // если все ок то возвращаем посты
      // json.decode парсит ответ
      return PostList.fromJson(json.decode(response.body));
    } else {
      // в противном случае говорим об ошибке
      throw Exception("failed request");
    }

  }
}
