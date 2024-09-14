import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/vaga.dart';

class VagaDao {
  final databaseReference = FirebaseFirestore.instance;
  final String COLECAO = "vagas";
  Future<String> inserir(Vaga vaga) async {
    try {
      DocumentReference ref =
          await databaseReference.collection(COLECAO).add(vaga.toMap());
      return ref.id;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> alterar(Vaga vaga) async {
    try {
      await databaseReference
          .collection(COLECAO)
          .doc(vaga.id)
          .update(vaga.toMap());
      return "Registro atualizado";
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Vaga>> findAll() async {
    QuerySnapshot vagas = await databaseReference.collection(COLECAO).get();
    List<Vaga> listaVagas = [];
    vagas.docs.forEach((elemento) {
      listaVagas.add(
          Vaga.fromJson(elemento.data() as Map<String, dynamic>, elemento.id));
    });
    return listaVagas;
  }

  Future<String> excluir(String id) async {
    try {
      await databaseReference.collection(COLECAO).doc(id).delete();
      return "Registro excluído com projeto";
    } catch (e) {
      return e.toString();
    }
  }
}
