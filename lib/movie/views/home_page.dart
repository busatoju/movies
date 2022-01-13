import 'package:challenge_movie/movie/controllers/movie_controller.dart';
import 'package:challenge_movie/movie/services/service.dart';
import 'package:challenge_movie/movie/state/state_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    DioService(),
  );

  @override
  void initState() {
    super.initState();
    _controller.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de filmes'),
      ),
      body: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, value, snapshot) {
            if (value is SuccessStateApp) {
              return ListView.builder(
                  itemCount: value.movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.movies[index].name),
                      subtitle: Text('${value.movies[index].age}'),
                    );
                  });
            }
            if (value is LoadingStateApp) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value is ErrorStateApp) {
              return Center(
                child: Text(value.message),
              );
            }
            return Container();
          }),
    );
  }
}
