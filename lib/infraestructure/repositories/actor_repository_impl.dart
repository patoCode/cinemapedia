import 'package:cinemapedia/domain/datasources/actors_datasources.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';
import 'package:cinemapedia/infraestructure/datasources/actor_moviedb_datasource.dart';

class ActorRepositoryImpl extends Actorsrepository {
  final ActorsDatasources datasource;

  ActorRepositoryImpl({required this.datasource});

  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}
