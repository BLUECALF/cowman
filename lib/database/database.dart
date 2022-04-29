import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'database.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Livestocks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get breed => text()();
  DateTimeColumn get dob => dateTime()();
}

// This will make drift generate a class called "Category" to represent a row in
// this table. By default, "Categorie" would have been used because it only
//strips away the trailing "s" in the table name.

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Livestocks])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;


  Stream<List<Livestock>> getLivestockListStream()
  {  return select(livestocks).watch(); }

  Future<List<Livestock>> getLivestockList() async
  {  return await select(livestocks).get(); }

  Future<int> insertLivestock(Livestock l) async
  {  return await into(livestocks).insert(l); }

}

