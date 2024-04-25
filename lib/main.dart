import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita ?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 1},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Amarelo', 'pontuacao': 6},
        {'texto': 'Azul', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito ?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 2},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Ovelha', 'pontuacao': 6},
        {'texto': 'Camelo', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito ?',
      'respostas': [
        {'texto': 'João', 'pontuacao': 2},
        {'texto': 'Maria', 'pontuacao': 4},
        {'texto': 'Jota', 'pontuacao': 8},
        {'texto': 'CR7', 'pontuacao': 7},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perguntas',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciar: _reiniciarQuestionario,
              ),
      ),
    );
  }
}
