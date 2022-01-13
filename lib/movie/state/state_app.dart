import 'package:challenge_movie/movie/models/movie_model.dart';

abstract class StateApp {}

class InitialStateApp implements StateApp {}

class LoadingStateApp implements StateApp {}

class SuccessStateApp implements StateApp {
  final List<MovieModel> movies;

  SuccessStateApp({
    required this.movies,
  });
}

class ErrorStateApp implements StateApp {
  final String message;
  
  ErrorStateApp({
    required this.message,
  });
}
