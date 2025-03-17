class NewAndHotModel {
  final String? backDropPath;
  final String? title;
  final String? originalTitle;
  final String? posterPath;
  final String? overView;
  final String? releaseDate;
  final String? originalLanguage;
  final int? id;

  NewAndHotModel({
    required this.backDropPath,
    required this.title,
    required this.posterPath,
    required this.overView,
    required this.releaseDate,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
  });

  factory NewAndHotModel.fromJson(Map<String, dynamic> json) {
    return NewAndHotModel(
        backDropPath: json["backdrop_path"],
        title: json["title"],
        posterPath: json["poster_path"],
        overView: json["overview"],
        releaseDate: json["release_date"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"]);
  }
}
