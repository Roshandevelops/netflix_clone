class MovieModel {
  final String? title;
  final String? posterPath;

  MovieModel({
    required this.posterPath,
    required this.title,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json["title"],
      posterPath: json["poster_path"],
    );
  }
}
