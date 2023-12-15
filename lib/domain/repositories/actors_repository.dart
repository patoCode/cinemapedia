import 'package:cinemapedia/domain/entities/actor.dart';

abstract class Actorsrepository {
  Future<List<Actor>> getActorByMovie(String movieId);
}
