import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ** cambiamos a un <StatefulWidget> porque es necesario agregar un listener al ListView<HorizontalSlideshow>, para saber cuando se cargaran mas peliculas(es decir llegamos al final)
class MovieHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  // ** Nos servira para indicar si cargamos mas peliculas o no, es opcional por si no queremos cargar mas peliculas
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    this.title,
    this.subtitle,
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // ** Agregamos los listener, cada vez que agregamos el listener inmediatamente agregamos el dispose() de ese listener.
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        // ** para asegurar que no sera null la funcion
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(
              title: widget.title,
              subtitle: widget.subtitle,
            ),
          // ** <Expanded> permite que el widget contenido(el que esta dentro) ocupe todo el espacio dsponible
          Expanded(
            child: ListView.builder(
              // ** agregamos un controller
              controller: scrollController,
              // ** Direccion del ListView
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              itemBuilder: (context, index) =>
                  _Slide(movie: widget.movies[index]),
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FadeInRight(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // !! No lo define Fernando, pero sin esto no da el height
            // ** Image
            Expanded(
              child: SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () => context.push('/movie/${movie.id}'),
                    child: Image.network(
                      movie.backdropPath,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: 150,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          );
                        }
                        return FadeIn(child: child);
                      },
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),
            // ** Title
            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                style: textTheme.bodySmall,
              ),
            ),
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  Icon(
                    Icons.star_half_outlined,
                    color: Colors.yellow.shade800,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${movie.voteAverage}',
                    style: textTheme.bodyMedium!
                        .copyWith(color: Colors.yellow.shade800),
                  ),
                  const Spacer(),
                  Text(
                    HumanFormats.number(movie.popularity),
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton(
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
              onPressed: () {},
              child: Text(subtitle!),
            )
        ],
      ),
    );
  }
}
