import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({
    required this.searchMovies,
  });

  // ! Este override no es obligatorio, pero es necesario si se quiere sobre escribir el placeholder del buscador
  @override
  String get searchFieldLabel => 'Buscar Pelicula';

  // ** Permite la creacion de acciones, similar a los botones de accion del AppBar
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(
            Icons.clear,
          ),
        ),
      )
    ];
  }

  // ** Para construir un icono al inicio, es el parametro clave para salir de la pantalla de busqueda
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios_outlined),
    );
  }

  // ** Los resuiltados de busqueda
  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }

  // ** Las sugerencias de la busqueda
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieResutlItem(
              movie: movie,
              onMovieSelected: close,
            );
          },
        );
      },
    );
  }
}

class _MovieResutlItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieResutlItem({
    required this.movie,
    required this.onMovieSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: size.width * .2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // description
            SizedBox(
              width: size.width * .7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.titleMedium,
                  ),
                  (movie.overview.length > 100)
                      ? Text(
                          '${movie.overview.substring(0, 100)}...',
                          style: textTheme.bodySmall,
                        )
                      : Text(movie.overview, style: textTheme.bodySmall),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade800,
                      ),
                      SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
