import 'package:flutter/material.dart';
import '../controller/vaga_controller.dart';
import '../model/vaga.dart';
import '../view/cadastro_vaga.dart';
import '../view/lista_vagas.dart';

// ignore: must_be_immutable
class VagaItem extends StatefulWidget {
  final Vaga _vaga;
  List<Vaga> _listaVagas;
  int _index;
  VagaItem(this._vaga, this._listaVagas, this._index);
  @override
  _VagaItemState createState() => _VagaItemState();
}

class _VagaItemState extends State<VagaItem> {
  Vaga? _ultimoRemovido;
  VagaController _vagaController = VagaController();
  _atualizarLista() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaVagas(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Card(
        color: Colors.blue[200],
        child: ListTile(
          title: Text(
            widget._vaga.nome,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          subtitle: Text(
            widget._vaga.cargaHoraria.toString(),
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CadastroVaga(
                  vaga: widget._listaVagas[widget._index],
                ),
              ),
            );
          },
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          mostrarAlerta(context);
        });
      },
    );
  }

  mostrarAlerta(BuildContext context) {
    Widget botaoNao = TextButton(
      child: const Text(
        "Não",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _atualizarLista();
      },
    );
    Widget botaoSim = TextButton(
      child: const Text(
        "Sim",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        _ultimoRemovido = widget._listaVagas[widget._index];
        widget._listaVagas.removeAt(widget._index);
        _vagaController.excluir(_ultimoRemovido!.id!);
        _atualizarLista();
      },
    );
    AlertDialog alerta = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.blue[200],
      title: const Text(
        "Aviso",
        style: TextStyle(color: Colors.black),
      ),
      content: const Text(
        "Deseja apagar o registro?",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        botaoNao,
        botaoSim,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
