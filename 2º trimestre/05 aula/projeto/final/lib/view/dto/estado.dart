class Estado{
  final dynamic id;
  final String nome;
  final String sigla;
  Estado({
    required this.id,
    required this.nome,
    required this.sigla
  });

  bool operator ==(o) => o is Estado && o.nome == nome && o.id == id;
}
