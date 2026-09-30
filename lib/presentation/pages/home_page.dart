import 'package:flutter/material.dart';
import 'package:meu_app_flutter/domain/usecases/listar_lagoas.dart';
import 'package:meu_app_flutter/presentation/pages/show_page.dart';

class HomePage extends StatelessWidget {
  final String title;
  final ListarLagoas listarLagoas;

  const HomePage({
    super.key,
    required this.title,
    this.listarLagoas = const ListarLagoas(),
  });

  @override
  Widget build(BuildContext context) {
    final lagoas = listarLagoas();

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.builder(
        itemCount: lagoas.length,
        itemBuilder: (context, index) {
          final lagoa = lagoas[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(lagoa.imagemUrl),
            ),
            title: Text(lagoa.nome),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowPage(title: lagoa.nome, lagoa: lagoa),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
