
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;


  // TODO Database Name Of Student Management
 String _dbName = "student_management_db.db";


 String adminTable = "admin_table";
 String studentTable = "student_table";
 String attendanceTable = "attendance_table";

  // String Col name Of Admin Table

 String adminId = "admin_id";
 String adminName = "admin_name";
 String adminContact = "admin_contact";
 String adminEmail = "admin_email";
 String adminPassword = "admin_password";

  // String Col Name student Table
  String studentId = "student_id";
 String studentRollNo = "student_roll_no";
 String studentName = "student_name";
 String studentEmail = "student_email";
 String studentContact = "student_contact";
 String studentGender = "student_gender";
 String studentCourse = "student_course";
 String studentImage = "student_image";

  // ===========================
  // ATTENDANCE TABLE COLUMNS
  // ===========================

 String attendanceId = "attendance_id";
 String attendanceStudentId = "student_id";
 String attendanceDate = "attendance_date";
 String attendanceStatus = "attendance_status";


  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    // ================= ADMIN TABLE =================

    await db.execute('''
    
      CREATE TABLE $adminTable(

        $adminId INTEGER PRIMARY KEY AUTOINCREMENT,
        $adminName TEXT,
        $adminContact TEXT,
        $adminEmail TEXT,
        $adminPassword TEXT
        
      )

    ''');
  }


  // TODO Insert Admin
  Future<int> insertAdmin({
    required String name,
    required String contact,
    required String email,
    required String password,
  }) async {

    final Database db = await database;

    Map<String, dynamic> adminData = {

      adminName: name,
      adminContact: contact,
      adminEmail: email,
      adminPassword: password,

    };

    int result = await db.insert(
      adminTable,
      adminData,
    );

    return result;
  }


  Future<bool> isAdminTableEmpty() async {

    final Database db = await database;

    List<Map<String, dynamic>> result =
    await db.query(adminTable);

    return result.isEmpty;
  }




  }