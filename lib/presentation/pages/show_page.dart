import 'package:flutter/material.dart';

import '../widgets/title_section.dart';
import '../widgets/button_section.dart';
import '../widgets/text_section.dart';
import '../../domain/models/lagoa.dart';

class ShowPage extends StatelessWidget {
  final String title;
  final Lagoa lagoa;

  const ShowPage({super.key, required this.title, required this.lagoa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView(
        children: [
          Image.network(
            lagoa.imagemUrl,
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          TitleSection(
            title: lagoa.nome,
            subtitle: lagoa.localidade,
            count: lagoa.likes,
          ),
          const ButtonSection(),
          TextSection(description: lagoa.descricao),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ),
        ],
      ),
    );
  }
}
