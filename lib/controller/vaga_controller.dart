import '../dao/vaga_dao.dart';
import '../model/vaga.dart';

class VagaController {
  VagaDao vagaDao = VagaDao();
  Future<String> salvar(Vaga vaga) {
    if (vaga.id == null) {
      return vagaDao.inserir(vaga);
    } else {
      return vagaDao.alterar(vaga);
    }
  }

  Future<List<Vaga>> findAll() async {
    return vagaDao.findAll();
  }

  Future<String> excluir(String id) {
    return vagaDao.excluir(id);
  }
}
