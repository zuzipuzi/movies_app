import 'package:movies_app/scr/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getAllMovies();

  Future<List<Movie>> searchMovie(String title);

  Future<List<Movie>> getFavoritesMovieList(List<String> movieId);

  Future<Movie> getMovie(String id);
}
