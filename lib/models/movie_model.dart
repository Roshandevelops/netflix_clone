class MovieModel {
  final String? title;
  final String? posterPath;
  final String? overView;
  final String? releaseDate;
  final String? originalLanguage;
  final int? id;
  final String? name;
  final String? backDropPath;

  MovieModel(
      {required this.posterPath,
      required this.title,
      required this.overView,
      required this.releaseDate,
      required this.id,
      required this.originalLanguage,
      required this.name,
      required this.backDropPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json["title"],
        posterPath: json["poster_path"],
        backDropPath: json["backdrop_path"],
        overView: json["overview"],
        releaseDate: json["release_date"],
        id: json["id"],
        originalLanguage: json["original_language"],
        name: json["name"]);
  }
}
