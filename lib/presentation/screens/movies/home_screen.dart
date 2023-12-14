import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}

// ** Un StatefulWidget se convierte en un <ConsumerStatefulWidget> de Riverpod, esto siempre sera asi
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  // ** Y esto ya no es un State, sino por el <ConsumerStatefulWidget> este se convertira en un <ConsumerState>
  // !! se cambia despues del metodo <class _HomeViewState extends ConsumerState<_HomeView> >
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

// ** Y esto ya no es un State, sino por el <ConsumerStatefulWidget> este se convertira en un <ConsumerState>
class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideShow(movies: slideShowMovies),
        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En cines',
          subtitle: "lunes 20",
          loadNextPage: () =>
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        ),
      ],
    );

    // return const Placeholder(
    //   strokeWidth: .5,
    //   color: Colors.white,
    //   child: Icon(
    //     Icons.tv_off_rounded,
    //     size: 50,
    //     color: Colors.white,
    //   ),
    // );
  }
}
