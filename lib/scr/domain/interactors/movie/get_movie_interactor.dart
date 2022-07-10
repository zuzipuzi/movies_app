import 'package:movies_app/scr/domain/entities/movie.dart';
import 'package:movies_app/scr/domain/interactors/base/base_interactor.dart';
import 'package:movies_app/scr/domain/repositories/movie_repository/movie_repository.dart';

class GetMovieInteractor extends BaseInteractor<String, Movie> {
  GetMovieInteractor(this.repository);

  final MovieRepository repository;

  @override
  Future<Movie> call(String id) async {
    return repository.getMovie(id);
  }
}
