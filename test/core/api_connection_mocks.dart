import 'package:mockito/annotations.dart';
import 'package:nerd_flutter/features/recipe/model/repo/recipe_repo.dart';

@GenerateMocks(<Type>[
  RecipeRepo,
])
Future<void> main() async {}
// void globalSetup( {String? tableName}) {
//   // when(mockSqlDb.readData(tableName ?? 'supaccountslist')).thenAnswer(
//   //     (Invocation realInvocation) async => <Map<String, dynamic>>[]);
//   // when(mockSqlDb.insertData()).thenAnswer((Invocation realInvocation) async {});
//   // when(mockSqlDb.deleteDatabase())
//   //     .thenAnswer((Invocation realInvocation) async {});
// }
