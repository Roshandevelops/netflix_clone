class SearchModel {
  final int? id;
  final String? title;
  final String? posterPath;

  SearchModel({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json["id"],
      title: json["title"],
      posterPath: json["poster_path"],
    );
  }
}
