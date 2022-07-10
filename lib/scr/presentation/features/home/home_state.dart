import 'package:equatable/equatable.dart';
import 'package:movies_app/scr/domain/entities/movie.dart';

class HomeState extends Equatable {
  const HomeState({
    this.movies = const [],
    this.progress = false,
  });

  final List<Movie> movies;
  final bool progress;

  HomeState copyWith({
    List<Movie>? movies,
    bool? progress,
  }) {
    return HomeState(
      movies: movies ?? this.movies,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [
        movies,
        progress,
      ];
}
