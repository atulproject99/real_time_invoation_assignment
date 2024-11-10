import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../../../../common/models/db_exception.dart';
import '../../../../common/utils/either.dart';
import '../model/employee_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  late Database _database;

  // Get the database instance
  Future<Database> get database async {
    try {
      _database = await initDatabase();
      return _database;
    } catch (e) {
      rethrow;
    }
  }

  // Initialize the database
  Future<Database> initDatabase() async {
    try {
      if (kIsWeb) {
        var factory = databaseFactoryFfiWeb;
        var db = await factory.openDatabase(
          'employee_database.db',
        );
        _onCreate(db, 1);
        return db;
      } else if (Platform.isAndroid || Platform.isIOS) {
        final dbPath = await getDatabasesPath();
        final path = join(dbPath, 'employee_database.db');
        return await openDatabase(path, version: 1, onCreate: _onCreate);
      } else {
        throw ('Unsupported platform');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Create the Employee table
  Future<void> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
        CREATE TABLE employees(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          role TEXT,
          startDate TEXT,
          endDate TEXT
        )
      ''');
    } catch (e) {
      rethrow;
    }
  }

  // Add an employee to the database
  Future<Either<DbException, int>> addEmployee(EmployeeModel employee) async {
    try {
      final db = await database;
      final result = await db.insert('employees', employee.toMap());
      return right(result); // Success: return the result
    } catch (e) {
      return left(DbException(
          'Failed to insert employee: $e')); // Return the exception in Left
    }
  }

  // Fetch all employees from the database
  Future<Either<DbException, List<EmployeeModel>>> getAllEmployees() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps =
          await db.query('employees', orderBy: 'id DESC');
      final employees = List.generate(maps.length, (i) {
        return EmployeeModel.fromMap(maps[i]);
      });
      return right(employees); // Success: return the list of employees
    } catch (e) {
      return left(DbException(
          'Failed to fetch employees: $e')); // Return the exception in Left
    }
  }

  // Update an employee in the database
  Future<Either<DbException, int>> updateEmployee(
      EmployeeModel employee) async {
    try {
      final db = await database;
      final result = await db.update(
        'employees',
        employee.toMap(),
        where: 'id = ?',
        whereArgs: [employee.id],
      );
      return right(result); // Success: return the result
    } catch (e) {
      return left(DbException(
          'Failed to update employee: $e')); // Return the exception in Left
    }
  }

  // Fetch employee details by ID
  Future<Either<DbException, EmployeeModel>> getEmployeeById(int id) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        'employees',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        return right(
            EmployeeModel.fromMap(maps.first)); // Return the found employee
      } else {
        return left(DbException(
            'Employee not found')); // Handle case if no employee is found
      }
    } catch (e) {
      return left(DbException(
          'Failed to fetch employee: $e')); // Return the exception in Left
    }
  }

  // Delete an employee from the database
  Future<Either<DbException, int>> deleteEmployee(int id) async {
    try {
      final db = await database;
      final result = await db.delete(
        'employees',
        where: 'id = ?',
        whereArgs: [id],
      );
      return right(result); // Success: return the result
    } catch (e) {
      return left(DbException(
          'Failed to delete employee: $e')); // Return the exception in Left
    }
  }

  // Close the database
  Future<Either<DbException, void>> close() async {
    try {
      final db = await database;
      await db.close();
      return right(null); // Success
    } catch (e) {
      return left(DbException(
          'Failed to close the database: $e')); // Return the exception in Left
    }
  }
}
