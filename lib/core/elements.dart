/// # Typing
/// ## A class that represents the typing of a [Species] or [Move].
///
/// Try to always use [isSingleType] to check if the typing is single or dual, before trying to access type2.
/// Example:
/// ```dart
/// if (typing.isSingleType()) {
///   // then it means that type2 is null
/// }
/// else {
///   // then it means that type2 is not null and can be safely accessed.
/// }
/// ```
class Typing {
  TypeElement type1;
  TypeElement? type2;

  Typing({required this.type1, this.type2});

  bool isSingleType() {
    return type2 == null;
  }

  TypeElement getType1() {
    return type1;
  }

  TypeElement? getType2() {
    return type2;
  }

  double getMultiplier() {
    return 1.0;
  }

  factory Typing.fromJson(List<dynamic> json) {
    if (json.length == 1) {
      return Typing(type1: TypeElement.fromJson(json[0]));
    } else {
      return Typing(
          type1: TypeElement.fromJson(json[0]),
          type2: TypeElement.fromJson(json[1]));
    }
  }
}

abstract class TypeElement {
  List<Type> get weakTo;
  List<Type> get resistTo;
  List<Type> get immuneTo;

  static List<Type> get allTypes => [
        Normal,
        Fire,
        Water,
        Electric,
        Grass,
        Ice,
        Fighting,
        Poison,
        Ground,
        Flying,
        Psychic,
        Bug,
        Rock,
        Ghost,
        Dragon,
        Dark,
        Steel,
        Fairy
      ];

  factory TypeElement.fromJson(Map<String, dynamic> json) {
    switch (json['type']['name']) {
      case 'normal':
        return Normal();
      case 'fire':
        return Fire();
      case 'water':
        return Water();
      case 'electric':
        return Electric();
      case 'grass':
        return Grass();
      case 'ice':
        return Ice();
      case 'fighting':
        return Fighting();
      case 'poison':
        return Poison();
      case 'ground':
        return Ground();
      case 'flying':
        return Flying();
      case 'psychic':
        return Psychic();
      case 'bug':
        return Bug();
      case 'rock':
        return Rock();
      case 'ghost':
        return Ghost();
      case 'dragon':
        return Dragon();
      case 'dark':
        return Dark();
      case 'steel':
        return Steel();
      case 'fairy':
        return Fairy();
      default:
        throw Exception('Unknown type: ${json['name']}');
    }
  }

  static bool isWeakTo(Type type, TypeElement element) {
    return element.weakTo.contains(type);
  }

  static bool isResistTo(Type type, TypeElement element) {
    return element.resistTo.contains(type);
  }

  static bool isImmuneTo(Type type, TypeElement element) {
    return element.immuneTo.contains(type);
  }
}

/// # Normal
/// ## A class that represents the Normal type.
/// ### Weak To:
/// - Fighting
/// ### Resist To:
/// - Ghost
class Normal implements TypeElement {
  @override
  List<Type> get weakTo => [Fighting];
  @override
  List<Type> get resistTo => [Ghost];
  @override
  List<Type> get immuneTo => [];
}

/// # Fire
/// ## A class that represents the Fire type.
/// ### Weak To:
/// - Water
/// - Ground
/// - Rock
/// ### Resist To:
/// - Fire
/// - Grass
/// - Ice
/// - Bug
/// - Steel
/// - Fairy
class Fire implements TypeElement {
  @override
  List<Type> get weakTo => [Water, Ground, Rock];
  @override
  List<Type> get resistTo => [Fire, Grass, Ice, Bug, Steel, Fairy];
  @override
  List<Type> get immuneTo => [];
}

/// # Water
/// ## A class that represents the Water type.
/// ### Weak To:
/// - Grass
/// - Electric
/// ### Resist To:
/// - Fire
/// - Water
/// - Ice
/// - Steel
class Water implements TypeElement {
  @override
  List<Type> get weakTo => [Electric, Grass];
  @override
  List<Type> get resistTo => [Fire, Ice, Steel, Water];
  @override
  List<Type> get immuneTo => [];
}

/// # Electric
/// ## A class that represents the Electric type.
/// ### Weak To:
/// - Ground
/// ### Resist To:
/// - Water
/// - Flying
/// - Steel
class Electric implements TypeElement {
  @override
  List<Type> get weakTo => [Ground];
  @override
  List<Type> get resistTo => [Water, Flying, Steel];
  @override
  List<Type> get immuneTo => [];
}

/// # Grass
/// ## A class that represents the Grass type.
/// ### Weak To:
/// - Fire
/// - Ice
/// - Poison
/// - Flying
/// - Bug
/// ### Resist To:
/// - Water
/// - Grass
/// - Electric
/// - Ground
class Grass implements TypeElement {
  @override
  List<Type> get weakTo => [Fire, Ice, Poison, Flying, Bug];
  @override
  List<Type> get resistTo => [Water, Grass, Electric, Ground];
  @override
  List<Type> get immuneTo => [];
}

/// # Ice
/// ## A class that represents the Ice type.
/// ### Weak To:
/// - Fire
/// - Fighting
/// - Rock
/// - Steel
/// ### Resist To:
/// - Ice
class Ice implements TypeElement {
  @override
  List<Type> get weakTo => [Fighting, Rock, Steel, Fire];
  @override
  List<Type> get resistTo => [Ice];
  @override
  List<Type> get immuneTo => [];
}

/// # Fighting
/// ## A class that represents the Fighting type.
/// ### Weak To:
/// - Flying
/// - Psychic
/// - Rock
/// ### Resist To:
/// - Bug
/// - Grass
/// - Ice
class Fighting implements TypeElement {
  @override
  List<Type> get weakTo => [Flying, Psychic, Rock];
  @override
  List<Type> get resistTo => [Bug, Grass, Ice];
  @override
  List<Type> get immuneTo => [];
}

/// # Poison
/// ## A class that represents the Poison type.
/// ### Weak To:
/// - Ground
/// - Psychic
/// ### Resist To:
/// - Fairy
/// - Grass
class Poison implements TypeElement {
  @override
  List<Type> get weakTo => [Ground, Psychic];
  @override
  List<Type> get resistTo => [Fairy, Grass];
  @override
  List<Type> get immuneTo => [];
}

/// # Ground
/// ## A class that represents the Ground type.
/// ### Weak To:
/// - Water
/// - Grass
/// - Ice
/// ### Resist To:
/// - Poison
/// - Rock
/// - Steel
/// ### Immune To:
/// - Electric
class Ground implements TypeElement {
  @override
  List<Type> get weakTo => [Water, Grass, Ice];
  @override
  List<Type> get resistTo => [Poison, Rock, Steel];
  @override
  List<Type> get immuneTo => [Electric];
}

/// # Flying
/// ## A class that represents the Flying type.
/// ### Weak To:
/// - Electric
/// - Ice
/// - Rock
/// ### Resist To:
/// - Grass
/// - Fighting
/// - Bug
/// ### Immune To:
/// - Ground
class Flying implements TypeElement {
  @override
  List<Type> get weakTo => [Electric, Ice, Rock];
  @override
  List<Type> get resistTo => [Grass, Fighting, Bug];
  @override
  List<Type> get immuneTo => [Ground];
}

/// # Psychic
/// ## A class that represents the Psychic type.
/// ### Weak To:
/// - Bug
/// - Ghost
/// - Dark
/// ### Resist To:
/// - Fighting
/// - Poison
class Psychic implements TypeElement {
  @override
  List<Type> get weakTo => [Bug, Ghost, Dark];
  @override
  List<Type> get resistTo => [Fighting, Poison];
  @override
  List<Type> get immuneTo => [];
}

/// # Bug
/// ## A class that represents the Bug type.
/// ### Weak To:
/// - Fire
/// - Flying
/// - Rock
/// ### Resist To:
/// - Grass
/// - Fighting
/// - Ground
class Bug implements TypeElement {
  @override
  List<Type> get weakTo => [Fire, Flying, Rock];
  @override
  List<Type> get resistTo => [Grass, Fighting, Ground];
  @override
  List<Type> get immuneTo => [];
}

/// # Rock
/// ## A class that represents the Rock type.
/// ### Weak To:
/// - Fighting
/// - Ground
/// - Steel
/// ### Resist To:
/// - Fire
/// - Ice
/// - Flying
/// - Bug
class Rock implements TypeElement {
  @override
  List<Type> get weakTo => [Fighting, Ground, Steel];
  @override
  List<Type> get resistTo => [Fire, Ice, Flying, Bug];
  @override
  List<Type> get immuneTo => [];
}

/// # Ghost
/// ## A class that represents the Ghost type.
/// ### Weak To:
/// - Ghost
/// - Dark
/// ### Resist To:
/// - Poison
/// - Bug
/// ### Immune To:
/// - Normal
/// - Fighting
class Ghost implements TypeElement {
  @override
  List<Type> get weakTo => [Dark, Ghost];
  @override
  List<Type> get resistTo => [Poison, Bug];
  @override
  List<Type> get immuneTo => [Normal, Fighting];
}

/// # Dragon
/// ## A class that represents the Dragon type.
/// ### Weak To:
/// - Steel
/// ### Resist To:
/// - Fire
/// - Water
/// - Grass
/// - Electric
class Dragon implements TypeElement {
  @override
  List<Type> get weakTo => [Ice, Dragon, Fairy];
  @override
  List<Type> get resistTo => [Fire, Water, Electric, Grass];
  @override
  List<Type> get immuneTo => [];
}

/// # Dark
/// ## A class that represents the Dark type.
/// ### Weak To:
/// - Fighting
/// - Bug
/// - Ghost
/// ### Resist To:
/// - Dark
/// - Ghost
/// ### Immune To:
/// - Psychic
class Dark implements TypeElement {
  @override
  List<Type> get weakTo => [Fighting, Bug, Ghost];
  @override
  List<Type> get resistTo => [Ghost, Dark];
  @override
  List<Type> get immuneTo => [Psychic];
}

/// # Steel
/// ## A class that represents the Steel type.
/// ### Weak To:
/// - Fire
/// - Fighting
/// - Ground
/// ### Resist To:
/// - Normal
/// - Grass
/// - Ice
/// - Flying
/// - Rock
/// - Bug
/// - Dragon
/// - Steel
/// ### Immune To:
/// - Poison
class Steel implements TypeElement {
  @override
  List<Type> get weakTo => [Fire, Fighting, Ground];
  @override
  List<Type> get resistTo =>
      [Normal, Grass, Ice, Flying, Rock, Bug, Dragon, Steel, Fairy];
  @override
  List<Type> get immuneTo => [Poison];
}

/// # Fairy
/// ## A class that represents the Fairy type.
/// ### Weak To:
/// - Steel
/// ### Resist To:
/// - Fighting
/// - Bug
/// - Dark
/// ### Immune To:
/// - Dragon
class Fairy implements TypeElement {
  @override
  List<Type> get weakTo => [Steel];
  @override
  List<Type> get resistTo => [Fighting, Bug, Dark];
  @override
  List<Type> get immuneTo => [Dragon];
}
