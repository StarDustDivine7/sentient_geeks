// import 'package:dio/dio.dart';

// class SearchRepository {
//   final Dio _dio = Dio();
//
//   Future<SearchResponseModel> searchPosts(String query) async {
//     try {
//       final response = await _dio.get(
//         "https://dummyjson.com/posts/search?q=$query",
//       );
//       if (response.statusCode == 200) {
//         return SearchResponseModel.fromJson(response.data);
//       } else {
//         throw Exception('Failed to load search results');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }
