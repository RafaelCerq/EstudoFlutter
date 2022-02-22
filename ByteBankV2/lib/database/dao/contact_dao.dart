import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';


class ContactDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';


  // Future<int> save(Contact contact) {
  //   return createDatabase().then((db) {
  //     final Map<String, dynamic> contactMap = Map();
  //     contactMap['id'] = contact.id;
  //     contactMap['name'] = contact.name;
  //     contactMap['account_number'] = contact.accountNumber;
  //     return db.insert('contacts', contactMap);
  //   });
  // }

  Future<int> save(Contact contact) async{
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert('contacts', contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

// Future<List<Contact>> findAll() {
//   return createDatabase().then((db) {
//     return db.query('contacts').then((maps) {
//       final List<Contact> contacts = [];
//       for (Map<String, dynamic> map in maps) {
//         final Contact contact = Contact(
//           map['id'],
//           map['name'],
//           map['account_number'],
//         );
//         contacts.add(contact);
//       }
//       return contacts;
//     });
//   });
// }

  Future<List<Contact>> findAll() async {

    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}