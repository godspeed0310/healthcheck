import 'package:healthcheck/models/medical_test.dart';

class SampleData {
  List<String> testCategories = [
    'Popular Tests',
    'Fever',
    'Covid 19',
    'Allergy Profiles',
    'Fitness'
  ];

  List<String> packageCategories = [
    'All Packages',
    'Elderly',
    'Heart',
    'Women Health',
    'Men'
  ];

  List<MedicalTest> labTest = [
    const MedicalTest(
      name: 'Complete Blood Count (CBC)',
      description:
          'A CBC is a common blood test that checks the different components of your blood, including red blood cells, white blood cells, platelets, and hemoglobin.',
      price: 499,
      discountedPrice: 399,
      tests: ['White blood cell count', 'Platelet count', 'Hemoglobin level'],
    ),
    const MedicalTest(
      name: "Basic Metabolic Panel (BMP)",
      description:
          "A BMP is a blood test that measures the levels of several chemicals in your blood, including glucose, electrolytes, and liver and kidney function tests.",
      price: 299,
      discountedPrice: 249,
      tests: [
        "Glucose",
        "Sodium",
        "Potassium",
        "Chloride",
        "Carbon dioxide",
        "Blood urea nitrogen (BUN)",
        "Creatinine",
        "Calcium",
        "Magnesium",
        "Phosphorus"
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
      name: "Iron Studies",
      description:
          "Iron studies are a group of blood tests that measure the levels of iron in your blood.",
      price: 129,
      discountedPrice: 99,
      tests: [
        "Serum iron",
        "Total iron binding capacity (TIBC)",
        "Transferrin saturation",
        "Ferritin"
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

  List<MedicalTest> packages = [
    const MedicalTest(
      name: "Basic Health Checkup",
      description:
          "A comprehensive screening package to assess your overall health.",
      price: 1500,
      tests: [
        "Complete Blood Count (CBC)",
        "Erythrocyte Sedimentation Rate (ESR)",
        "Blood Sugar Fasting",
        "Blood Sugar Postprandial",
        "Kidney Function Tests (KFT)",
        "Liver Function Tests (LFT)",
        "Lipid Profile"
      ],
    ),
    const MedicalTest(
      name: "Advanced Health Checkup",
      description:
          "An in-depth checkup to identify potential health risks and provide personalized recommendations.",
      price: 2500,
      discountedPrice: 2200,
      tests: [
        "All tests from Basic Health Checkup",
        "Thyroid Function Tests (TFT)",
        "Electrocardiogram (ECG)",
        "Chest X-ray"
      ],
    ),
    const MedicalTest(
      name: "Women's Health Checkup",
      description:
          "A tailored checkup for women, focusing on reproductive health and overall well-being.",
      price: 2000,
      discountedPrice: 1800,
      tests: [
        "All tests from Basic Health Checkup",
        "Pap Smear",
        "Mammogram or Ultrasound (depending on age)",
        "Bone Density Scan (for women over 50)"
      ],
    ),
    const MedicalTest(
      name: "Men's Health Checkup",
      description:
          "A comprehensive checkup for men, addressing common health concerns and preventive measures.",
      price: 1800,
      discountedPrice: 1600,
      tests: [
        "All tests from Basic Health Checkup",
        "Prostate-Specific Antigen (PSA) test",
        "Testosterone Level Test"
      ],
    ),
  ];
}
