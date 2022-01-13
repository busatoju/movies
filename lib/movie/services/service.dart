import 'package:challenge_movie/movie/models/movie_model.dart';
import 'package:dio/dio.dart';

abstract class IService {
  Future<List<MovieModel>> getMovies();
}

const url =
    'https://my-json-server.typicode.com/ericqueirozc/fteamtraineeapi/movies';

class DioService implements IService {
  final dio = Dio();

  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await dio.get(url);
      final movies = response.data as List;
      return movies.map(MovieModel.fromMap).toList();
    } on DioError catch (_) {
      rethrow;
    }
  }
}
