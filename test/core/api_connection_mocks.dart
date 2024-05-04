import 'package:mockito/annotations.dart';
import 'package:nerd_flutter/features/receipe/model/repo/api_repo.dart';

@GenerateMocks(<Type>[
  APIRepo,
])
Future<void> main() async {}
// void globalSetup( {String? tableName}) {
//   // when(mockSqlDb.readData(tableName ?? 'supaccountslist')).thenAnswer(
//   //     (Invocation realInvocation) async => <Map<String, dynamic>>[]);
//   // when(mockSqlDb.insertData()).thenAnswer((Invocation realInvocation) async {});
//   // when(mockSqlDb.deleteDatabase())
//   //     .thenAnswer((Invocation realInvocation) async {});
// }
