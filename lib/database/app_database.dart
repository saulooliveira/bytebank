import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete);
  );
}

Future<int> save(Contato contact) async {
  Database db = await createDatabase();
  final Map<String, dynamic> contactMap = {};
  contactMap['id'] = contact.id;
  contactMap['name'] = contact.nome;
  contactMap['account_number'] = contact.conta;
  return db.insert('contacts', contactMap);
}

Future<int> delete(int id) async {
  Database db = await createDatabase();
  return db.delete('contacts', where: 'id = ?', whereArgs: [id]);
}

Future<List<Contato>> findAll() async {
  Database db = await createDatabase();
  return db.query('contacts').then((maps) {
    final List<Contato> contacts = [];
    for (Map<String, dynamic> map in maps) {
      final Contato contact =
          Contato(map['name'], map['account_number'], id: map['id']);
      contacts.add(contact);
    }
    return contacts;
  });
}
