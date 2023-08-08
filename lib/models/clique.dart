import '../enums/clique_type_enum.dart';

class Clique {
  final String id;
  final String name;
  final String? description;
  final String? photo;
  final String? parentClique;
  final List<String> childCliques;
  final List<String> memberIds;
  final List<String>?
      instructorIds; // Some cliques don't have instructors Like main, college and major cliques.

  Clique({
    required this.id,
    required this.name,
    required this.description,
    required this.childCliques,
    required this.memberIds,
    this.photo,
    this.instructorIds,
    this.parentClique, // Main clique doesn't have a parent clique
  });

  @override
  String toString() => name;
}
