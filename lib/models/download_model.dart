class DownloadModel {
  final String? posterPath;

  DownloadModel({required this.posterPath});

  factory DownloadModel.fromJson(Map<String, dynamic> json) {
    return DownloadModel(
      posterPath: json["poster_path"],
    );
  }
}
