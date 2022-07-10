import 'package:movies_app/scr/domain/entities/movie.dart';
import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/movie_repository/movie_repository.dart';

class GetFavoritesMovieListInteractor
    extends BaseInteractor<List<String>, List<Movie>> {
  GetFavoritesMovieListInteractor(this.repository);

  final MovieRepository repository;

  @override
  Future<List<Movie>> call(List<String> movieId) async {
    return repository.getFavoritesMovieList(movieId);
  }
}
