class Movie {
  Movie(
      {required this.id,
      required this.title,
      required this.year,
      required this.duration,
      required this.genre,
      required this.plot,
      required this.poster});

  final String id;
  final String title;
  final int year;
  final String duration;
  final String genre;
  final String plot;
  final String poster;

  Map<String, dynamic> toMap(Movie movie) {
    return {
      'id': id,
      'title': title,
      'year': year,
      'duration': duration,
      'genre': genre,
      'plot': plot,
      'poster': poster,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        id: map['id'],
        title: map['title'],
        year: map['year'],
        duration: map['duration'],
        genre: map['genre'],
        plot: map['plot'],
        poster: map['poster']);
  }
}
