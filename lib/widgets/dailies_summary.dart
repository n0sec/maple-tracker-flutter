import 'package:flutter/material.dart';

import '../models/character.dart';
import '../models/activity.dart';

class DailiesSummary extends StatelessWidget {
  const DailiesSummary({Key? key, required this.selectedCharacter})
      : super(key: key);

  final Character? selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
            child: Text(
              'Dailies',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      color: const Color(0xfffb923c),
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.red,
                        highlightColor: Colors.redAccent,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bosses',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${selectedCharacter?.completedDailyBosses.length}/${Task.values.where((task) => task.taskType == TaskType.dailyBoss).length}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Material(
                      color: const Color(0xfffb923c),
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.red,
                        highlightColor: Colors.redAccent,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tasks',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${selectedCharacter?.completedDailyTasks.length}/${Task.values.where((task) => task.taskType == TaskType.dailyTask).length}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Material(
                      color: const Color(0xfffb923c),
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        splashColor: Colors.red,
                        highlightColor: Colors.redAccent,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Arcane River',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${selectedCharacter?.completedDailyArcaneRiver.length}/${Task.values.where((task) => task.taskType == TaskType.dailyArcaneRiver).length}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
