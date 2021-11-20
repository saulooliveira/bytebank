class Contato {
  final int? id;
  final String nome;
  final int conta;

  Contato(this.nome, this.conta, {this.id});

  @override
  String toString() {
    return 'Contato{$nome, $conta}';
  }
}
