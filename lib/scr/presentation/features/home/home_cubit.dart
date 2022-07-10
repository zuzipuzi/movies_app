import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/scr/domain/interactors/movie/get_all_movies_interactor.dart';
import 'package:movies_app/scr/presentation/features/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAllMoviesInteractor) : super(const HomeState());
  final GetAllMoviesInteractor _getAllMoviesInteractor;

  Future<void> getAllMovies() async {
    try {
      emit(state.copyWith(progress: true));
      final allMovies = await _getAllMoviesInteractor.call();
      emit(state.copyWith(movies: allMovies));
    } finally {
      emit(state.copyWith(progress: false));
    }
  }
}
