import 'package:flutter/material.dart';
import '../component/dropdown_component.dart';
import '../component/textfield_component.dart';
import '../controller/vaga_controller.dart';
import '../model/vaga.dart';
import 'lista_vagas.dart';

class CadastroVaga extends StatefulWidget {
  final Vaga? vaga;
  CadastroVaga({this.vaga});
  @override
  _CadastroVagaState createState() => _CadastroVagaState();
}

class _CadastroVagaState extends State<CadastroVaga> {
  VagaController _vagaController = VagaController();
  String? _id;
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cargaHorariaController = TextEditingController();
  TextEditingController _modalidadeController = TextEditingController();
  var _modalidades = ["PRESENCIAL", "SEMI_PRESENCIAL", "EAD"];
  var _modalidadeSelecionada = "PRESENCIAL";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _alterarModalidade(String novaModalidadeSelecionada) {
    _dropDownModalidadeSelected(novaModalidadeSelecionada);
    setState(() {
      this._modalidadeSelecionada = novaModalidadeSelecionada;
      _modalidadeController.text = this._modalidadeSelecionada;
    });
  }

  _dropDownModalidadeSelected(String novaModalidade) {
    setState(() {
      this._modalidadeSelecionada = novaModalidade;
    });
  }

  _displaySnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.green[900],
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _salvar(BuildContext context) {
    final vaga = Vaga(_nomeController.text,
        int.parse(_cargaHorariaController.text), _modalidadeSelecionada,
        id: _id ?? null);
    setState(() {
      _vagaController.salvar(vaga).then((res) {
        _displaySnackBar(context, res.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListaVagas(),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    if (widget.vaga != null) {
      _id = widget.vaga!.id;
      _nomeController.text = widget.vaga!.nome;
      _cargaHorariaController.text = widget.vaga!.cargaHoraria.toString();
      _modalidadeSelecionada = widget.vaga!.modalidade;
    } else {
      _id = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastro de vaga"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaVagas()),
              );
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldComponent(
                  label: "Nome",
                  controller: _nomeController,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldComponent(
                  label: "Carga horária",
                  controller: _cargaHorariaController,
                  textInputType: TextInputType.number),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Modalidade:",
                    style: TextStyle(color: Colors.orange[800]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DropdownComponent(
                      elementos: _modalidades,
                      itemSelecionado: _modalidadeSelecionada,
                      onChanged: (novaModalidade) {
                        setState(() => _modalidadeSelecionada = novaModalidade);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _salvar(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green, backgroundColor: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  label: const Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
