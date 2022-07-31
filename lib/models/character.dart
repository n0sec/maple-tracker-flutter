import 'package:equatable/equatable.dart';

import 'activity.dart';

class Character extends Equatable {
  final String name;
  final MapleClass
      mapleClass; // Provides the class name, asset path and class color
  final bool isFavorite;
  final Set<Task> completedDailyBosses;
  final Set<Task> incompleteDailyBosses;
  final Set<Task> completedDailyTasks;
  final Set<Task> incompleteDailyTasks;
  final Set<Task> completedDailyArcaneRiver;
  final Set<Task> incompleteDailyArcaneRiver;
  final Set<Task> completedWeeklyBosses;
  final Set<Task> incompleteWeeklyBosses;
  final Set<Task> completedWeeklyTasks;

  String get className {
    return mapleClass.className;
  }

  String get assetPath {
    return mapleClass.assetPath;
  }

  int get classColor {
    return mapleClass.classColor;
  }

  Character({
    required this.name,
    required this.mapleClass,
    required this.isFavorite,
    required this.completedDailyBosses,
    required this.completedDailyTasks,
    required this.completedDailyArcaneRiver,
    required this.completedWeeklyBosses,
    required this.completedWeeklyTasks,
  })  : incompleteDailyBosses = Task.values
            .where((task) => task.taskType == TaskType.dailyBoss)
            .toSet(),
        incompleteDailyTasks = Task.values
            .where((task) => task.taskType == TaskType.dailyTask)
            .toSet(),
        incompleteDailyArcaneRiver = Task.values
            .where((task) => task.taskType == TaskType.dailyArcaneRiver)
            .toSet(),
        incompleteWeeklyBosses = Task.values
            .where((task) => task.taskType == TaskType.weeklyBoss)
            .toSet();

  @override
  List<Object?> get props => [
        name,
        mapleClass,
        isFavorite,
        completedDailyBosses,
        completedDailyTasks,
        completedDailyArcaneRiver,
        completedWeeklyBosses,
        completedWeeklyTasks
      ];

  @override
  bool get stringify => true;

  // Creates a copy of the current Character with property changes
  Character copyWith({
    String? name,
    MapleClass? mapleClass,
    bool? isFavorite,
    Set<Task>? completedDailyBosses,
    Set<Task>? completedDailyArcaneRiver,
    Set<Task>? completedDailyTasks,
    Set<Task>? completedWeeklyBosses,
    Set<Task>? completedWeeklyTasks,
  }) {
    return Character(
      name: name ?? this.name,
      mapleClass: mapleClass ?? this.mapleClass,
      isFavorite: isFavorite ?? this.isFavorite,
      completedDailyBosses: completedDailyBosses ?? this.completedDailyBosses,
      completedDailyTasks: completedDailyTasks ?? this.completedDailyTasks,
      completedDailyArcaneRiver:
          completedDailyArcaneRiver ?? this.completedDailyArcaneRiver,
      completedWeeklyBosses:
          completedWeeklyBosses ?? this.completedWeeklyBosses,
      completedWeeklyTasks: completedWeeklyTasks ?? this.completedWeeklyTasks,
    );
  }
}

enum MapleClass {
  adele('Adele', 'assets/images/classes/adele.webp', 0xff93c5fd),
  angelicBuster('Angelic Buster', 'assets/images/classes/angelic_buster.webp',
      0xfff757cc),
  aran('Aran', 'assets/images/classes/aran.webp', 0xff7893c3),
  ark('Ark', 'assets/images/classes/ark.webp', 0xff801100),
  battleMage(
      'Battle Mage', 'assets/images/classes/battle_mage.webp', 0xff746fc7),
  beastTamer(
      'Beast Tamer', 'assets/images/classes/beast_tamer.webp', 0xffa16207),
  bishop('Bishop', 'assets/images/classes/bishop.webp', 0xfff0de54),
  blaster('Blaster', 'assets/images/classes/blaster.webp', 0xff914206),
  blazeWizard(
      'Blaze Wizard', 'assets/images/classes/blaze_wizard.webp', 0xffdc6e53),
  bowMaster('Bow Master', 'assets/images/classes/bow_master.webp', 0xff059669),
  buccaneer('Buccaneer', 'assets/images/classes/buccaneer.webp', 0xff22e1f9),
  cadena('Cadena', 'assets/images/classes/cadena.webp', 0xffbe185d),
  cannoneer('Cannoneer', 'assets/images/classes/cannoneer.webp', 0xff6f3738),
  corsair('Corsair', 'assets/images/classes/corsair.webp', 0xffe2cab3),
  darkKnight('Dark Knight', 'assets/images/classes/corsair.webp', 0xff5907a3),
  dawnWarrior(
      'Dawn Warrior', 'assets/images/classes/dawn_warrior.webp', 0xffd19a5c),
  demonAvenger(
      'Demon Avenger', 'assets/images/classes/demon_avenger.webp', 0xff2f0347),
  demonSlayer(
      'Demon Slayer', 'assets/images/classes/demon_slayer.webp', 0xff2d0b40),
  dualBlade('Dual Blade', 'assets/images/classes/dual_blade.webp', 0xff271f29),
  evan('Evan', 'assets/images/classes/evan.webp', 0xff8bb4be),
  hayato('Hayato', 'assets/images/classes/hayato.webp', 0xffbc2450),
  hero('Hero', 'assets/images/classes/hayato.webp', 0xff8e6d5d),
  hoyoung('Hoyoung', 'assets/images/classes/hoyoung.webp', 0xff0ea5e9),
  illium('Illium', 'assets/images/classes/illium.webp', 0xff3b82f6),
  jett('Jett', 'assets/images/classes/jett.webp', 0xff7c3aed),
  kain('Kain', 'assets/images/classes/kain.webp', 0xff7f1d1d),
  kaiser('Kaiser', 'assets/images/classes/kaiser.webp', 0xffdc2626),
  kanna('Kanna', 'assets/images/classes/kanna.webp', 0xff9333ea),
  kinesis('Kinesis', 'assets/images/classes/kinesis.webp', 0xff44403c),
  lara('Lara', 'assets/images/classes/lara.webp', 0xff99edc3),
  luminous('Luminous', 'assets/images/classes/luminous.webp', 0xff618096),
  firePoisonMage(
      'Fire/Poison Mage', 'assets/images/classes/fp_mage.webp', 0xff15803d),
  iceLightningMage(
      'Ice/Lightning Mage', 'assets/images/classes/fp_mage.webp', 0xff60a5fa),
  marksman('Marksman', 'assets/images/classes/marksman.webp', 0xff69785f),
  mechanic('Mechanic', 'assets/images/classes/mechanic.webp', 0xff4c383c),
  mercedes('Mercedes', 'assets/images/classes/mercedes.webp', 0xffa3e635),
  mihile('Mihile', 'assets/images/classes/mihile.webp', 0xfffcd34d),
  nightLord('Night Lord', 'assets/images/classes/night_lord.webp', 0xff701a75),
  nightWalker(
      'Night Walker', 'assets/images/classes/night_walker.webp', 0xff581c87),
  paladin('Paladin', 'assets/images/classes/paladin.webp', 0xffe1ba88),
  pathfinder('Pathfinder', 'assets/images/classes/pathfinder.webp', 0xff4c1d95),
  phantom('Phantom', 'assets/images/classes/phantom.webp', 0xff3672c8),
  shade('Shade', 'assets/images/classes/shade.webp', 0xff4aded1),
  shadower('Shadower', 'assets/images/classes/shadower.webp', 0xff86198f),
  thunderBreaker('Thunder Breaker',
      'assets/images/classes/thunder_breaker.webp', 0xff22a4e6),
  wildHunter(
      'Wild Hunter', 'assets/images/classes/wild_hnuter.webp', 0xff819e4e),
  windArcher(
      'Wind Archer', 'assets/images/classes/wind_archer.webp', 0xff0fb14b),
  xenon('Xenon', 'assets/images/classes/xenon.webp', 0xff76bce0),
  zero('Zero', 'assets/images/classes/zero.webp', 0xff9e3030);

  const MapleClass(this.className, this.assetPath, this.classColor);
  final String className;
  final String assetPath;
  final int classColor;
}
