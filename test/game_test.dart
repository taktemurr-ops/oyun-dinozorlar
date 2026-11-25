import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dinozorlar/oyun_dinozorlar.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dinozorlarConfig.title.length, 33);
    expect(dinozorlarConfig.tagline.length, 33);
    for (final s in dinozorlarConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dinozorlarConfig.gameId, dinozorlarId);
    expect(dinozorlarRules.gameId, dinozorlarId);
    expect(dinozorlarConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dinozorlarRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dinozorlarId, optionalMechanics: dinozorlarRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dinozorlarRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
