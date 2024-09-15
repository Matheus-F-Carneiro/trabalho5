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
  TextEditingController _empresaController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _cargaHorariaController = TextEditingController();
  TextEditingController _salarioController = TextEditingController();
  TextEditingController _localidadeController = TextEditingController();

  List<String> _requisitos = [];
  TextEditingController _requisitoController = TextEditingController();
  var _modalidades = ["PRESENCIAL", "HÍBRIDO", "REMOTO"];
  var _modalidadeSelecionada = "PRESENCIAL";

  bool _status = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _alterarModalidade(String novaModalidadeSelecionada) {
    _dropDownModalidadeSelected(novaModalidadeSelecionada);
    setState(() {
      this._modalidadeSelecionada = novaModalidadeSelecionada;
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

  _adicionarRequisito() {
    setState(() {
      _requisitos.add(_requisitoController.text);
      _requisitoController.clear();
    });
  }

  _salvar(BuildContext context) {
    final vaga = Vaga(
      nome: _nomeController.text,
      empresa: _empresaController.text,
      descricao: _descricaoController.text,
      cargaHoraria: int.parse(_cargaHorariaController.text),
      modalidade: _modalidadeSelecionada,
      salario: double.parse(_salarioController.text),
      requisitos: _requisitos,
      localidade: _localidadeController.text,
      dataPublicacao: DateTime.now(),
      status: _status,
      id: _id ?? null,
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Cadastro de Vaga'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFieldComponent(
                    label: "Nome da Vaga", controller: _nomeController),
                TextFieldComponent(
                    label: "Nome da Empresa", controller: _empresaController),
                TextFieldComponent(
                    label: "Descrição", controller: _descricaoController),
                TextFieldComponent(
                    label: "Carga Horária",
                    controller: _cargaHorariaController,
                    textInputType: TextInputType.number),
                TextFieldComponent(
                    label: "Salário",
                    controller: _salarioController,
                    textInputType: TextInputType.number),
                TextFieldComponent(
                    label: "Localidade", controller: _localidadeController),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFieldComponent(
                          label: "Adicionar Requisito",
                          controller: _requisitoController),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _adicionarRequisito,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Modalidade:",
                        style: TextStyle(color: Colors.blue[200]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: DropdownComponent(
                          elementos: _modalidades,
                          itemSelecionado: _modalidadeSelecionada,
                          onChanged: (novaModalidade) {
                            setState(
                                () => _modalidadeSelecionada = novaModalidade);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SwitchListTile(
                  title: Text("Status da Vaga (Ativa)"),
                  value: _status,
                  onChanged: (bool value) {
                    setState(() {
                      _status = value;
                    });
                  },
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
                        foregroundColor: Colors.green,
                        backgroundColor: Theme.of(context).primaryColor,
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
        ],
      ),
    );
  }
}
