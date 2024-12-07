class HeroModel {
  final String name;
  final String image;
  final String description;
  final double speed, health, attack;

  HeroModel({
    required this.name,
    required this.image,
    required this.description,
    required this.speed,
    required this.health,
    required this.attack,
  });
}

final List<HeroModel> heroes = [
  HeroModel(
    name: 'Unggoy',
    image: 'Challenge_images/grunt.png',
    description: 'Los Unggoy, también conocidos como Grunts, fueron usados por el Covenant como soldados de infantería y trabajadores. Los Unggoy no son agresivos por naturaleza',
    speed: 16.0,
    health: 40.0,
    attack: 70.0,
  ),
  HeroModel(
    name: 'Jameson Locke',
    image: 'Challenge_images/lock.png',
    description: 'El Spartan Jameson Locke (Número de Servicio: 73808-3153-JL) es un SPARTAN-IV y antiguo agente de la Oficina de Inteligencia Naval',
    speed: 90.0,
    health: 100.0,
    attack: 75.0,
  ),
  HeroModel(
    name: 'Cortana',
    image: 'Challenge_images/pozole.png',
    description: 'Cortana posee una personalidad inteligente y vivaz, además de un buen sentido del humor. Su lealtad hacia los humanos está programada, pero ella dice que su lealtad es genuina',
    speed: 10.0,
    health: 100.0,
    attack: 100.0,
  ),
];
