import 'package:flutter_dotenv/flutter_dotenv.dart';

// ** Para no estar escribiendo los keys del environment a mano mejor lo ponemos en una clase.
class Environment {
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'key is not defined';
}
