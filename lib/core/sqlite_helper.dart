import 'package:my_places/models/place_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqliteHelper {
  static Future<Database> initialize() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'places.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
CREATE TABLE places(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  description TEXT,
  category TEXT,
  imagePath TEXT,
  latitude REAL,
  longitude REAL,
  createdAt TEXT
)
''');
      },
    );
  }

  static Database? database;
  static Future<Database?> getDatabase() async {
    database ??= await initialize();
    return database;
  }

  static Future<void> insertPlace(PlaceModel place) async {
    Database? db = await getDatabase();
    await db!.insert('places', {
      'name': place.name,
      'description': place.description,
      'category': place.category,
      'imagePath': place.imagePath,
      'latitude': place.latitude,
      'longitude': place.longitude,
      'createdAt': place.createdAt.toIso8601String(),
    });
  }

  static Future<List<PlaceModel>> getPlaces() async {
    Database? db = await getDatabase();
    final List<Map<String, dynamic>> places = await db!.query(
      'places',
    ); //[{},Model,{}]
    return places
        .map(
          (e) => PlaceModel(
            id: e['id'] as int,
            name: e['name'] as String,
            description: e['description'] as String,
            category: e['category'] as String,
            imagePath: e['imagePath'] as String,
            latitude: e['latitude'] as double,
            longitude: e['longitude'] as double,
            createdAt: DateTime.parse(e['createdAt'] as String),
          ),
        )
        .toList();
  }

  static Future<void> deletePlace(int id) async {
    Database? db = await getDatabase();
    await db!.delete('places', where: 'id=?', whereArgs: [id]);
  }

  static Future<void> updatePlace(PlaceModel place) async {
    Database? db = await getDatabase();
    await db!.update(
      'places',
      {
        'id': place.id,
        'name': place.name,
        'description': place.description,
        'category': place.category,
        'imagePath': place.imagePath,
        'latitude': place.latitude,
        'longitude': place.longitude,
        'createdAt': place.createdAt.toIso8601String(),
      },
      where: 'id=?',
      whereArgs: [place.id],
    );
  }
}
