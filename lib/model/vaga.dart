class Vaga {
  String? id;
  String nome;
  int cargaHoraria;
  String modalidade;
  Vaga(this.nome, this.cargaHoraria, this.modalidade, {this.id});
  Map<String, dynamic> toMap() => {
        "nome": nome,
        "cargaHoraria": cargaHoraria,
        "modalidade": modalidade,
      };
  @override
  String toString() {
    return "Vaga: $nome \n Carga Horária: $cargaHoraria \n modalidade: $modalidade";
  }

  Vaga.fromJson(Map<String, dynamic> json, String id_firebase)
      : nome = json["nome"],
        cargaHoraria = json["cargaHoraria"],
        modalidade = json["modalidade"],
        id = id_firebase;
}
