class Vaga {
  String? id;
  String nome;
  String empresa;
  String descricao;
  int cargaHoraria;
  String modalidade;
  double salario;
  List<String> requisitos;
  String localidade;
  DateTime dataPublicacao;
  bool status;

  Vaga(
      {this.id,
      required this.nome,
      required this.empresa,
      required this.descricao,
      required this.cargaHoraria,
      required this.modalidade,
      required this.salario,
      required this.requisitos,
      required this.localidade,
      required this.dataPublicacao,
      required this.status});

 
  Map<String, dynamic> toMap() => {
        "nome": nome,
        "empresa": empresa,
        "descricao": descricao,
        "cargaHoraria": cargaHoraria,
        "modalidade": modalidade,
        "salario": salario,
        "requisitos": requisitos,
        "localidade": localidade,
        "dataPublicacao": dataPublicacao.toIso8601String(),
        "status": status,
      };

  @override
  String toString() {
    return """
    Vaga: $nome 
    Empresa: $empresa 
    Descrição: $descricao 
    Carga Horária: $cargaHoraria horas semanais 
    Modalidade: $modalidade 
    Salário: R\$ $salario 
    Requisitos: ${requisitos.join(", ")} 
    Localidade: $localidade 
    Data de Publicação: ${dataPublicacao.toIso8601String()}
    Status: ${status ? "Ativa" : "Fechada"}""";
  }

 
  Vaga.fromJson(Map<String, dynamic> json, String id_firebase)
      : nome = json["nome"],
        empresa = json["empresa"],
        descricao = json["descricao"],
        cargaHoraria = json["cargaHoraria"],
        modalidade = json["modalidade"],
        salario = json["salario"],
        requisitos = List<String>.from(json["requisitos"]),
        localidade = json["localidade"],
        dataPublicacao = DateTime.parse(json["dataPublicacao"]),
        status = json["status"],
        id = id_firebase;
}
