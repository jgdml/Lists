class Lista{

    int? id;
    
    String nome;
    List<String> campos;
    bool isPublic = false;

    Lista({this.id, required this.nome, required this.campos});
}