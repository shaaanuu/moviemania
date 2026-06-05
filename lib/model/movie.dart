class MovieModel {
  final String title;
  final String image;
  final String overview;
  final String? backdropPath;
  final int id;
  final List<int> genreIds;
  final String mediaType;
  final double voteAverage;
  final String? releaseDate;

  MovieModel({
    required this.title,
    required this.image,
    required this.overview,
    this.backdropPath,
    required this.id,
    required this.genreIds,
    required this.mediaType,
    required this.voteAverage,
    this.releaseDate,
  });

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500/$backdropPath'
      : '';

  String get imageUrl =>
      image.isNotEmpty ? 'https://image.tmdb.org/t/p/w500/$image' : '';

  String get formattedRating => voteAverage.toStringAsFixed(1);

  String get year => releaseDate != null && releaseDate!.isNotEmpty
      ? releaseDate!.substring(0, 4)
      : '';

  List<String> get genres =>
      genreIds.map((id) => genreMap[id] ?? 'Unknown').toList();

  factory MovieModel.fromMap(Map<String, dynamic> json) {
    final isMovie = json['media_type'] == 'movie' || json.containsKey('title');

    return MovieModel(
      id: json['id'],
      title: json['title'] ?? json['name'] ?? '',
      image: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? (isMovie ? 'movie' : 'tv'),
      overview: json['overview'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'] ?? json['first_air_date'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }
}

const genreMap = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  27: "Horror",
  9648: "Mystery",
  10749: "Romance",
  878: "Sci-Fi",
  53: "Thriller",
  10752: "War",
  37: "Western",
};
