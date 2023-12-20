import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    // * Para rutas padre/hijo
    // GoRoute(
    //     path: '/',
    //     name: HomeScreen.name,
    //     builder: (context, state) => const HomeScreen(childView: HomeView()),
    //     routes: [
    //       GoRoute(
    //         path: 'movie/:id',
    //         name: MovieScreen.name,
    //         builder: (context, state) {
    //           final id = state.pathParameters['id'] ?? 'no-id';
    //           return MovieScreen(
    //             movieId: id,
    //           );
    //         },
    //       ),
    //     ]),
    // * USANDO SHELL ROUTER
    // ShellRoute(
    //     builder: (context, state, child) {
    //       return HomeScreen(childView: child);
    //     },
    //     routes: [
    //       GoRoute(
    //           path: '/',
    //           builder: (context, state) {
    //             return const HomeView();
    //           },
    //           routes: [
    //             GoRoute(
    //               path: 'movie/:id',
    //               name: MovieScreen.name,
    //               builder: (context, state) {
    //                 final id = state.pathParameters['id'] ?? 'no-id';
    //                 return MovieScreen(
    //                   movieId: id,
    //                 );
    //               },
    //             ),
    //           ]),
    //       GoRoute(
    //         path: '/favorites',
    //         builder: (context, state) {
    //           return const FavoritesView();
    //         },
    //       ),
    //     ])

    GoRoute(
        path: '/home/:page',
        name: HomeScreen.name,
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
          return HomeScreen(pageIndex: pageIndex);
        },
        routes: [
          GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';
              return MovieScreen(movieId: movieId);
            },
          ),
        ]),

    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
