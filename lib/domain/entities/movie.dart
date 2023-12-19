import 'package:isar/isar.dart';
// * Despues dela instalacion esta linea dara error, hasta generar el build
// * Ejecutado el Build el error desaparece
// * Si todo en el build salio bien, se creara el archivo *.g en el mismo directorio que la entitie
part 'movie.g.dart';

@collection
class Movie {
  // * Se lo deja opcional porque ISAR se hara cargo de la gestion del ID
  Id? isarId;
  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});
}
