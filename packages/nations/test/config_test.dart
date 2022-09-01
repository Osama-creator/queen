import 'package:flutter_test/flutter_test.dart';
import 'package:nations/nations.dart';
import 'package:nations/src/lang_config.dart';
import 'package:nations/src/loaders/nation_assets.dart';

import 'lib.dart';

void main() => test(
      'config always return null',
      () {
        const config = LangConfig();
        expect(config.notFound('key'), 'null');
        expect(config.notFoundPlural('key', 0, {}), 'null');
        expect(config.notFoundArgs('key', {}), 'null');
        expect(config.notFoundGender('key'), 'null');
      },
    );

class NationsTestConfig extends LangConfig {
  @override
  List<NationsLoader> get loaders => [
        NationsTestLoader(),
        const NationsAssetsLoader(),
      ];
}

class NotFoundTestConfig extends NationsTestConfig {
  @override
  String notFound(String key) => 'not_found';

  /// not found builder
  /// to build the not found string
  @override
  String notFoundPlural(
    String key,
    int count,
    Map<String, Object> args,
  ) =>
      'not_found_plural';

  /// not found builder
  /// to build the not found string
  @override
  String notFoundArgs(
    String key,
    Map<String, Object> args,
  ) =>
      'not_found_args';

  /// not found builder
  /// to build the not found string
  @override
  String notFoundGender(
    String key, [
    Gender? gender,
  ]) {
    switch (gender) {
      case Gender.male:
        return 'not_found_gender_male';
      case Gender.female:
        return 'not_found_gender_female';
      default:
        return 'not_found_gender';
    }
  }
}
