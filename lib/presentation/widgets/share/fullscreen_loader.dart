import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  const FullscreenLoader({super.key});

  Stream<String> getLoadMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Comprando palomitas',
      'Cargando populares',
      'Llamando compañia para ver la pelicula',
      'Ya casi.... ',
      'Esto esta tardando mas de lo esperado 😢',
    ];

    return Stream.periodic(const Duration(milliseconds: 1700), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Espera por favor.."),
          const SizedBox(height: 10),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Cargando...");
              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
