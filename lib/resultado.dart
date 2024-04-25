import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciar;

  String get freseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else {
      return 'nivel jedi!';
    }
  }

  const Resultado({
    super.key,
    required this.pontuacao,
    required this.quandoReiniciar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            freseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciar,
          child: const Text('Reiniciar'),
        )
      ],
    );
  }
}
