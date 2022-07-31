class Activity {
  final Task task;

  Activity({required this.task});

  Activity copyWith({
    Task? task,
  }) {
    return Activity(task: task ?? this.task);
  }
}

enum TaskType {
  dailyBoss,
  weeklyBoss,
  dailyTask,
  weeklyTask,
  dailyArcaneRiver,
}

enum Task {
  arcana('Arcana', 'assets/images/arcane_river/arcane.webp',
      TaskType.dailyArcaneRiver),
  akechiMitsuhide('Akechi Mitsuhide',
      'assets/images/bosses/akechi_mitsuhide.webp', TaskType.weeklyBoss),
  arkarium(
      'Arkarium', 'assets/images/bosses/arkarium.webp', TaskType.dailyBoss),
  chaosCrimsonQueen('Chaos Crimson Queen',
      'assets/images/bosses/crimson_queen.webp', TaskType.weeklyBoss),
  chaosPapulatus('Chaos Papulatus', 'assets/images/bosses/papulatus.webp',
      TaskType.weeklyBoss),
  chaosPierre(
      'Chaos Pierre', 'assets/images/bosses/pierre.webp', TaskType.weeklyBoss),
  chaosVellum(
      'Chaos Vellum', 'assets/immages/bosses/vellum.webp', TaskType.weeklyBoss),
  chaosVonBon('Chaos Von Bon', 'assets/images/bosses/von_bon.webp',
      TaskType.weeklyBoss),
  chuChu(
      'Chu Chu', 'assets/images/arcane_river/chu_chu.webp', TaskType.dailyTask),
  coinCapping('Coin Capping', 'assets/images/tasks/coin_capping.png',
      TaskType.dailyTask),
  commerci('Commerci', 'assets/images/tasks/commerci.webp', TaskType.dailyTask),
  crimsonQueen('Crimson Queen', 'assets/images/bosses/crimson_queen.webp',
      TaskType.dailyBoss),
  cygnus('Cygnus', 'assets/images/cygnus.webp', TaskType.weeklyBoss),
  dailyGift(
      'Daily Gift', 'assets/images/tasks/daily_gift.png', TaskType.dailyTask),
  damien('Damien', 'assets/images/bosses/damien.webp', TaskType.weeklyBoss),
  darkWorldTree('Dark World Tree', 'assets/images/tasks/dark_world_tree.webp',
      TaskType.weeklyTask),
  darknell(
      'Darknell', 'assets/images/bosses/darknell.webp', TaskType.weeklyBoss),
  esfera('Esfera', 'assets/images/arcane_river/esfera.webp',
      TaskType.dailyArcaneRiver),
  flagRace(
      'Flag Race', 'assets/images/tasks/flag_race.webp', TaskType.weeklyTask),
  gloom('Gloom', 'assets/images/bosses/gloom_webp', TaskType.weeklyBoss),
  gollux('Gollux', 'assets/images/bosses/gollux.webp', TaskType.dailyBoss),
  guardianAngelSlime('Guardian Angel Slime',
      'assets/images/bosses/guardian_angel_slime.webp', TaskType.weeklyBoss),
  guildBuff(
      'Guild Buff', 'assets/images/tasks/guild_buff.png', TaskType.weeklyTask),
  hardHilla('Hard Hilla', 'assets/images/bosses/hard_hilla.webp',
      TaskType.weeklyBoss),
  hardMagnus('Hard Magnus', 'assets/images/bosses/hard_magnus.webp',
      TaskType.weeklyBoss),
  hilla('Hilla', 'assets/images/bosses/hilla.webp', TaskType.dailyBoss),
  horntail(
      'Horntail', 'assets/images/bosses/horntail.webp', TaskType.dailyBoss),
  julieta('Julieta', 'assets/images/bosses/julieta.webp', TaskType.dailyBoss),
  kritias('Kritias', 'assets/images/tasks/kritias.webp', TaskType.weeklyTask),
  lachelein('Lachelein', 'assets/images/arcane_river/lachelein.webp',
      TaskType.dailyArcaneRiver),
  legion('Legion', 'assets/images/tasks/legion.webp', TaskType.dailyTask),
  lotus('Lotus', 'assets/images/bosses/lotus.webp', TaskType.weeklyBoss),
  lucid('Lucid', 'assets/images/bosses/lucid.webp', TaskType.weeklyBoss),
  magnus('Magnus', 'assets/images/bosses/magnus.webp', TaskType.dailyBoss),
  mapleTour(
      'Maple Tour', 'assets/images/tasks/maple_tour.webp', TaskType.dailyTask),
  monsterPark('Monster Park', 'assets/images/tasks/monster_park.webp',
      TaskType.dailyTask),
  morass('Morass', 'assets/images/arcane_river/morass.webp',
      TaskType.dailyArcaneRiver),
  moriRanmaru('Mori Ranmaru', 'assets/images/bosses/mori_ranmaru.webp',
      TaskType.dailyBoss),
  muLungDojo('Mu Lung Dojo', 'assets/images/tasks/mu_lung_dojo.webp',
      TaskType.weeklyTask),
  omniCln('OMNI-CLN', 'assets/images/bosses/omni_cln.webp', TaskType.dailyBoss),
  papulatus(
      'Papulatus', 'assets/images/bosses/papulatus.webp', TaskType.dailyBoss),
  phantomForest('Phantom Forest', 'assets/images/tasks/phantom_forest.webp',
      TaskType.dailyTask),
  pierre('Pierre', 'assets/images/bosses/pierre.webp', TaskType.dailyBoss),
  pinkBean(
      'Pink Bean', 'assets/images/bosses/pink_bean.webp', TaskType.dailyBoss),
  princessNo('Princess No', 'assets/images/bosses/princess_no.webp',
      TaskType.weeklyBoss),
  scrapyard(
      'Scrapyard', 'assets/images/tasks/scrapyard.webp', TaskType.weeklyTask),
  sharenianCulvert('Sharenian Culvert', 'assets/images/tasks/culvert.webp',
      TaskType.weeklyTask),
  ursus('Ursus', 'assets/images/tasks/ursus.webp', TaskType.dailyTask),
  vanishingJourney(
      'Vanishing Journey',
      'assets/images/arcane_river/vanishing_journey.webp',
      TaskType.dailyArcaneRiver),
  vellum('Vellum', 'assets/images/bosses/vellum.webp', TaskType.dailyBoss),
  verusHilla('Verus Hilla', 'assets/images/bosses/verus_hilla.webp',
      TaskType.weeklyBoss),
  vonBon('Von Bon', 'assets/images/bosses/von_bon.webp', TaskType.dailyBoss),
  vonLeon('Von Leon', 'assets/images/bosses/von_leon.webp', TaskType.dailyBoss),
  will('Will', 'assets/images/bosses/will.webp', TaskType.weeklyBoss),
  yuGarden(
      'Yu Garden', 'assets/images/tasks/yu_garden.webp', TaskType.dailyTask),
  zakum('Zakum', 'assets/images/bosses/zakum.webp', TaskType.dailyBoss);

  const Task(this.label, this.assetPath, this.taskType);
  final String label;
  final String assetPath;
  final TaskType taskType;

  int taskTypeCount(TaskType taskType) =>
      Task.values.where((task) => task.taskType == taskType).length;
}
