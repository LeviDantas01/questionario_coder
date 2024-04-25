import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String txtResposta;
  final void Function() quandoSelecionado;
  
  const Resposta({
    super.key,
    required this.txtResposta,
    required this.quandoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: FloatingActionButton(
              onPressed: quandoSelecionado,
              backgroundColor: Colors.blue,
              child: Text(txtResposta),
            ),
          )
        ],
      ),
    );
  }
}
