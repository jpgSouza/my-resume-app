class Skill {
  String tile;
  String description;

  Skill(this.tile, this.description);

  Map<String, dynamic> toMap() {
    return {'title': tile, 'description': description};
  }
}
