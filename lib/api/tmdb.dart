import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_key.dart';
import '../model/movie.dart';

class TMDB {
  static const _base = 'api.themoviedb.org';

  static Future<List<MovieModel>> trendingDay() async {
    final uri = Uri.https(
      _base,
      '/3/trending/all/day',
      {'api_key': apiKey},
    );

    final res = await http.get(uri);
    final data = jsonDecode(res.body);

    final list = data['results'] as List;

    return list.map((e) => MovieModel.fromMap(e)).toList();
  }

  static Future<List<MovieModel>> topRated() async {
    final movieUri = Uri.https(
      'api.themoviedb.org',
      '/3/movie/top_rated',
      {'api_key': apiKey},
    );

    final tvUri = Uri.https(
      'api.themoviedb.org',
      '/3/tv/top_rated',
      {'api_key': apiKey},
    );

    final responses = await Future.wait([
      http.get(movieUri),
      http.get(tvUri),
    ]);

    final movieData = jsonDecode(responses[0].body)['results'] as List;
    final tvData = jsonDecode(responses[1].body)['results'] as List;

    final movies = movieData
        .map((e) => MovieModel.fromMap({
              ...e,
              'media_type': 'movie',
            }))
        .toList();

    final tv = tvData
        .map((e) => MovieModel.fromMap({
              ...e,
              'media_type': 'tv',
            }))
        .toList();

    final combined = [...movies, ...tv];

    combined.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));

    return combined;
  }

  static Future<List<MovieModel>> upcoming() async {
    final movieUri = Uri.https(
      'api.themoviedb.org',
      '/3/movie/upcoming',
      {'api_key': apiKey},
    );

    final tvUri = Uri.https(
      'api.themoviedb.org',
      '/3/tv/on_the_air',
      {'api_key': apiKey},
    );

    final res = await Future.wait([
      http.get(movieUri),
      http.get(tvUri),
    ]);

    final movieData = jsonDecode(res[0].body)['results'] as List;
    final tvData = jsonDecode(res[1].body)['results'] as List;

    final movies = movieData.map((e) => MovieModel.fromMap({
          ...e,
          'media_type': 'movie',
        }));

    final tv = tvData.map((e) => MovieModel.fromMap({
          ...e,
          'media_type': 'tv',
        }));

    final combined = [...movies, ...tv].toList();

    combined.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));

    return combined;
  }
}
