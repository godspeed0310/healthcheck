import 'package:healthcheck/models/medical_test.dart';

class SampleData {
  List<MedicalTest> labTest = [
    const MedicalTest(
      name: 'Complete Blood Count (CBC)',
      description:
          'A CBC is a common blood test that checks the different components of your blood, including red blood cells, white blood cells, platelets, and hemoglobin.',
      price: 499,
      discountedPrice: 399,
      tests: [
        'Red blood cell count',
        'White blood cell count',
        'Platelet count',
        'Hemoglobin level'
      ],
    ),
    const MedicalTest(
      name: 'Lipid Profile',
      description:
          'A lipid profile is a blood test that measures the levels of cholesterol, triglycerides, and HDL (good) and LDL (bad) cholesterol in your blood.',
      price: 599,
      discountedPrice: 499,
      tests: [
        'Total cholesterol',
        'Triglycerides',
        'HDL cholesterol',
        'LDL cholesterol'
      ],
    ),
    const MedicalTest(
      name: 'Thyroid Function Test (TFT)',
      description:
          'A TFT is a blood test that measures the levels of thyroid hormones in your blood. These hormones help control your metabolism, growth, and development.',
      price: 399,
      discountedPrice: 299,
      tests: [
        'Thyroid-stimulating hormone (TSH)',
        'Free T4 (FT4)',
        'Free T3 (FT3)',
        'Triiodothyronine (T3)',
        'Thyroxine (T4)'
      ],
    ),
    const MedicalTest(
      name: 'Vitamin D Test',
      description:
          'A vitamin D test measures the level of vitamin D in your blood. Vitamin D is important for bone health and immune function.',
      price: 349,
      discountedPrice: 249,
      tests: ['25-hydroxyvitamin D'],
    ),
  ];
}
