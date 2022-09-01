import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queen/queen.dart';

import 'lib.dart';

Future<void> main() async {
  setUpAll(() => TestWidgetsFlutterBinding.ensureInitialized());
  setUp(() async => App.boot());
  tearDown(() => Locators.clear());

  test('it loads saved locale form prefs if exist', () async {
    SharedPreferences.setMockInitialValues({
      'queen.nations.lang': 'ar',
    });
    Locators.clear();
    await App.boot();
    expect(App.locale, const Locale('ar'));
  });

  group('load method', () {
    test('it always load the nations assets', () async {
      final controller = Locators.find<TransController>();
      controller.load(const Locale('en'));
      expect(controller.translations.containsKey('gender'), isTrue);
    });
    // test('it loads all the loaders and add them by loader name', () async {
    //   await App.boot(
    //     nationsConfig: LangConfig(
    //       loaders: [
    //         NationsTestLoader('test_1'),
    //         NationsTestLoader('test_2'),
    //         NationsTestLoader('test_3'),
    //         NationsTestLoader('test_4'),
    //         NationsTestLoader('test_5'),
    //       ],
    //     ),
    //   );
    //   expect('test_1.test_k'.tr, 'test_v');
    //   expect('test_2.test_k'.tr, 'test_v');
    //   expect('test_3.test_k'.tr, 'test_v');
    //   expect('test_4.test_k'.tr, 'test_v');
    //   expect('test_5.test_k'.tr, 'test_v');
    // });
    // test('it can override any value on any loader', () async {
    //   await App.boot(
    //     nationsConfig: LangConfig(
    //       loaders: [
    //         NationsTestLoader('test_package', {'foo_key': 'test_1'}),
    //       ],
    //       baseLoader: NationsTestLoader(
    //         'this name does not matter',
    //         {
    //           'test_package': {'foo_key': 'overridden_data'}
    //         },
    //       ),
    //     ),
    //   );
    // expect('test_package.foo_key'.tr, 'overridden_data');
    // });

    // test('it will not deletes data when it override any value on any loader',
    //     () async {
    //   await App.boot(
    //     nationsConfig: LangConfig(
    //       loaders: [
    //         NationsTestLoader('test_package', {
    //           'foo_key': 'test_1',
    //           'bar_key': 'bar_value',
    //         }),
    //       ],
    //       baseLoader: NationsTestLoader(
    //         'this name does not matter',
    //         {
    //           'test_package': {'foo_key': 'overridden_data'}
    //         },
    //       ),
    //     ),
    //   );

    //   expect('test_package.foo_key'.tr, 'overridden_data');
    //   expect('test_package.bar_key'.tr, 'bar_value');
    // });
  });
}
