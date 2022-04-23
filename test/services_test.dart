

import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test("Testing if services is working properly", () async{


    expect(await Services.getUsers(), const TypeMatcher<List<UserData>>());
    expect(await Services.getPosts("1"), const TypeMatcher<List<PostData>>());

  });
}