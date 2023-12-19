import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasources {
  // * es late porque al momento der iniciar la app ISAR puede no estar lista
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationCacheDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    // * Si ya existe una instancia de la BD se retorna esa instancia
    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    // * idEqualsTo => es por convencion y quisiera comparar otro campo cambio la palabra id por el nombre del campo a consultar
    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    // * Realizaremos una transaccion con la BD
    final isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (favoriteMovie != null) {
      // borrar
      // * Usaremos el IsarID porque aca ya lo tenemos, IsarID existe si el registro ya esta en la BD
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
    }
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
