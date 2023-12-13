import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/moviedb_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ** Provider es inmutable, es decir no cambiara con el tiempo
final movieRepositoryProvider = Provider((ref) {
  return MovieDbRepositoryImpl(datasource: MovieDbDatasource());
});
