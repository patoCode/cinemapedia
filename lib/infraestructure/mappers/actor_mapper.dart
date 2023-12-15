import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/original${cast.profilePath}'
            : 'https://i0.wp.com/www.low-industries.com/wp-content/uploads/Default-profile-pic-1.jpg?fit=860%2C609&ssl=1https://www.pngkey.com/png/detail/121-1219160_small-facebook-no-profile-picture-girl.png',
        character: cast.character,
      );
}
