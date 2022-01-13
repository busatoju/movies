import 'package:challenge_movie/movie/models/movie_model.dart';
import 'package:challenge_movie/movie/services/service.dart';
import 'package:challenge_movie/movie/state/state_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MovieController extends ValueNotifier<StateApp> {
  final IService service;

  MovieController(
    this.service,
  ) : super(InitialStateApp());

  Future<void> getMovies() async {
    value = LoadingStateApp();
    try {
      var movies = await service.getMovies();
      value = SuccessStateApp(movies: movies);
    } on DioError catch (e) {
      value = ErrorStateApp(message: e.message);
    }
  }
}
