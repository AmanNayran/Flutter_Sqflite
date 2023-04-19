import 'package:flutter/material.dart';

import '../db/db.dart';

class MyCadastroPage extends StatefulWidget {
  const MyCadastroPage({super.key});

  @override
  State<MyCadastroPage> createState() => _MyCadastroPageState();
}

class _MyCadastroPageState extends State<MyCadastroPage> {
  final _usernameController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 200, left: 50, right: 50),
          child: Column(
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/753/753399.png',
                width: 200,
              ),
              const SizedBox(height: 30,),

              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Username',
                )
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Senha',
                )
              ),
              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () async {
                  final username = _usernameController.text;
                  final senha = _senhaController.text;
                  final db = await openDB();

                  await db.insert('user', {'username': username, 'senha': senha});

                  _usernameController.clear();
                  _senhaController.clear();
                }, 
                child: const Text('Cadastrar')
              )
            ],
          )
        ),
      ),
    );
  }
}
