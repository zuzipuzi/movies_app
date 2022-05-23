class User {
  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.email,
      required this.country,
      required this.favoritesMoviesId});

  final String id;
  final String name;
  final String surname;
  final String email;
  final String country;
  final List<String> favoritesMoviesId;

  Map<String, dynamic> toMap(User user) {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'country': country,
      'favoritesMoviesId': favoritesMoviesId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        name: map['name'],
        surname: map['surname'],
        email: map['email'],
        country: map['country'],
        favoritesMoviesId: map['favoritesMoviesId']);
  }
}
