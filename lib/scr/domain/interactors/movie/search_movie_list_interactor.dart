import 'package:movies_app/scr/domain/entities/movie.dart';
import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/movie_repository/movie_repository.dart';

class SearchMovieListInteractor extends BaseInteractor<String, List<Movie>> {
  SearchMovieListInteractor(this.repository);

  final MovieRepository repository;

  @override
  Future<List<Movie>> call(String title) async {
    return repository.searchMovie(title);
  }
}
