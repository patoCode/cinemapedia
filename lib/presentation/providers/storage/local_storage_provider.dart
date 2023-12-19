import 'package:cinemapedia/infraestructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStoageRepositoryProvider = Provider((ref) {
  // * Aca directamente le enviamos un datasource ISAR
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});
