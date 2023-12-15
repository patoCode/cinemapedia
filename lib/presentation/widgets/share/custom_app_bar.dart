import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.movie_outlined,
              color: color.primary,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Cinemapedia',
              style: titleStyle,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                // ! stc15
                // ** Permite la funcionalidad de buscador, esto es gestionado por Flutter casi de forma automatica.
                final movieRepository = ref.read(movieRepositoryProvider);
                // !! No se recomienda hacerlo de esta forma, ya que al ser un Future el context pudo haber cambiado
                // final selectedMovieTap = await showSearch<Movie?>(
                //   context: context,
                //   delegate: SearchMovieDelegate(
                //       searchMovies: movieRepository.searchMovie),
                // );
                // final selectedMovieTap = await showSearch<Movie?>(
                //   context: context,
                //   delegate: SearchMovieDelegate(
                //       searchMovies: movieRepository.searchMovie),
                // );
                // if (selectedMovieTap != null) {
                //   context.push('/movie/${selectedMovieTap.id}');
                // }
                showSearch<Movie?>(
                  context: context,
                  delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovie),
                ).then((movie) {
                  if (movie == null) return;
                  context.push('/movie/${movie.id}');
                });
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
    );
  }
}
