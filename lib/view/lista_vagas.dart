import 'package:flutter/material.dart';
import '../component/vaga_item.dart';
import '../controller/vaga_controller.dart';
import '../model/vaga.dart';
import 'cadastro_vaga.dart';

class ListaVagas extends StatefulWidget {
  @override
  _ListaVagasState createState() => _ListaVagasState();
}

class _ListaVagasState extends State<ListaVagas> {
  List<Vaga> _listaVagas = [];
  VagaController _vagaController = VagaController();
  @override
  void initState() {
    super.initState();
    _vagaController.findAll().then((dados) {
      setState(() {
        _listaVagas = dados;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de vagas"),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Vaga>>(
        initialData: _listaVagas,
        future: _vagaController.findAll(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Vaga>? vagas = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Vaga vaga = vagas[index];
                  return VagaItem(vaga, _listaVagas, index);
                },
                itemCount: vagas!.length,
              );
          }
          return Text("Erro");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CadastroVaga(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[200],
      ),
    );
  }
}
