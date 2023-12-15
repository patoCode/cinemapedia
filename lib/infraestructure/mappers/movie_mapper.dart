import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMaper {
  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/original${movieDb.backdropPath}'
            : 'https://images.wondershare.com/repairit/aticle/2021/07/resolve-images-not-showing-problem-1.jpg',
        genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: movieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/original${movieDb.posterPath}'
            : 'https://i0.wp.com/moviemarker.co.uk/wp-content/uploads/NoPosterAvailable.jpg',
        releaseDate:
            movieDb.releaseDate != null ? movieDb.releaseDate! : DateTime.now(),
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
        adult: movieDb.adult,
        backdropPath: movieDb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/original${movieDb.backdropPath}'
            : 'https://images.wondershare.com/repairit/aticle/2021/07/resolve-images-not-showing-problem-1.jpg',
        genreIds: movieDb.genres.map((e) => e.name).toList(),
        id: movieDb.id,
        originalLanguage: movieDb.originalLanguage,
        originalTitle: movieDb.originalTitle,
        overview: movieDb.overview,
        popularity: movieDb.popularity,
        posterPath: movieDb.posterPath != ''
            ? 'https://image.tmdb.org/t/p/original${movieDb.posterPath}'
            : 'no-poster',
        releaseDate: movieDb.releaseDate,
        title: movieDb.title,
        video: movieDb.video,
        voteAverage: movieDb.voteAverage,
        voteCount: movieDb.voteCount,
      );
}
