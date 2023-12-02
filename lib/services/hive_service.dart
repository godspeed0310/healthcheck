import 'package:healthcheck/app/app.logger.dart';
import 'package:healthcheck/models/appointment.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final log = getLogger('HiveService');

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MedicalTestAdapter());
    Hive.registerAdapter(AppointmentAdapter());
    await Hive.openBox<MedicalTest>('cart');
    await Hive.openBox<Appointment>('appointments');
    log.i('Hive Service initialized');
  }

  Future<void> addToCart(MedicalTest medicalTest) async {
    final box = Hive.box<MedicalTest>('cart');
    await box.put(medicalTest.name, medicalTest);
  }

  Future<void> removeFromCart(MedicalTest test) async {
    final box = Hive.box<MedicalTest>('cart');
    await box.delete(test.name);
  }

  Future<void> clearCart() async {
    final box = Hive.box<MedicalTest>('cart');
    await box.clear();
  }

  Future<List<MedicalTest>> getCart() async {
    final box = Hive.box<MedicalTest>('cart');
    return box.values.toList();
  }
}
