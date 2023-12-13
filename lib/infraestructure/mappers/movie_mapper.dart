import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMaper {
  static Movie movieDbToEntity(MovieMovieDB movierDb) => Movie(
        adult: movierDb.adult,
        backdropPath: movierDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movierDb.backdropPath}'
            : 'https://images.wondershare.com/repairit/aticle/2021/07/resolve-images-not-showing-problem-1.jpg',
        genreIds: movierDb.genreIds.map((e) => e.toString()).toList(),
        id: movierDb.id,
        originalLanguage: movierDb.originalLanguage,
        originalTitle: movierDb.originalTitle,
        overview: movierDb.overview,
        popularity: movierDb.popularity,
        posterPath: movierDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movierDb.posterPath}'
            : 'no-poster',
        releaseDate: movierDb.releaseDate,
        title: movierDb.title,
        video: movierDb.video,
        voteAverage: movierDb.voteAverage,
        voteCount: movierDb.voteCount,
      );
}
