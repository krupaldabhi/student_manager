import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

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
  String studentGender = "student_gender";
  String studentDob = "student_dob";
  String studentClass = "student_class";
  String studentFatherName = "student_father";
  String studentMotherName = "student_mother";
  String studentContact = "student_contact";
  String studentContact2 = "student_contact_2";
  String studentAddress = "student_address";

  // ATTENDANCE TABLE COLUMNS


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

    return await openDatabase(path, version: 1, onCreate: onCreate);
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

    // TODO For Student Table
    await db.execute('''
      
        CREATE TABLE $studentTable(
  
          $studentId INTEGER PRIMARY KEY AUTOINCREMENT,
         $studentRollNo TEXT,
         $studentName TEXT,
         $studentGender TEXT,
         $studentDob TEXT,
         $studentClass TEXT,
         $studentFatherName TEXT,
         $studentMotherName TEXT,
         $studentContact TEXT,
         $studentContact2 TEXT,
         $studentAddress TEXT
         
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

    int result = await db.insert(adminTable, adminData);

    return result;
  }

  Future<bool> isAdminTableEmpty() async {
    final Database db = await database;

    List<Map<String, dynamic>> result = await db.query(adminTable);

    return result.isEmpty;
  }

  // TODO Insert Student
  Future<int> insertStudent({
    required String rollNo,
    required String name,
    required String gender,
    required String dob,
    required String className,
    required String fatherName,
    required String motherName,
    required String parentContact,
    required String alternetContact,
    required String address,
  }) async {
    final Database db = await database;

    Map<String, dynamic> studentData = {
      studentRollNo: rollNo,
      studentName: name,
      studentGender: gender,
      studentDob: dob,
      studentClass: className,
      studentFatherName: fatherName,
      studentMotherName: motherName,
      studentContact: parentContact,
      studentContact2: alternetContact,
      studentAddress: address,
    };

    int result = await db.insert(studentTable, studentData);
    print("Inserted Student ID: $studentId");
    return result;
  }
  // TODO Fetch All Students
  Future<List<Map<String, dynamic>>> getAllStudents() async {

    final Database db = await database;

    List<Map<String, dynamic>> studentList =
    await db.query(studentTable);

    return studentList;
  }
}
