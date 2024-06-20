import 'package:test/test.dart';

import 'package:bgsearchapp/0_data/repository.dart';

void main() {
  test('Counter value should be incremented', () async {
    final repository = HttpSearchRepository();

    var infos = await repository.getShortGameInfos("n:catan");

    for (var info in infos) {
      print(info.id);
      print(info.name);
      print(info.imageUri);
      print("");
    }



  });
}