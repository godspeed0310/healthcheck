import 'package:badges/badges.dart' as bd;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/constants/shared_constants.dart';
import 'package:healthcheck/data/sample_data.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/home_view_model.dart';
import 'package:healthcheck/views/cart_view/cart_view.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/lab_test_card.dart';
import 'package:healthcheck/widgets/package_card.dart';
import 'package:healthcheck/widgets/section_header.dart';
import 'package:healthcheck/widgets/stadium_border_button.dart';
import 'package:healthcheck/widgets/unbounded_list_view.dart';
import 'package:stacked/stacked.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return DefaultSystemOverlay(
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (_, __) {
                return [
                  SliverToBoxAdapter(
                    child: Container(
                      height: 127,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 40,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Health Check',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => model.switchThemes(),
                            icon: Icon(
                              context.isDarkEnabled
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                              color: context.primaryColor,
                            ),
                          ),
                          const Gap(15),
                          IconButton(
                            onPressed: () => model.openUserHistory(),
                            icon: Icon(
                              Icons.history,
                              color: context.primaryColor,
                            ),
                          ),
                          const Gap(15),
                          CustomOpenContainer(
                            closedBuilder: (_, __) {
                              return ValueListenableBuilder(
                                valueListenable: model.cartListenable,
                                builder: (_, value, __) {
                                  final int cartCount = value.values.length;

                                  if (cartCount == 0) {
                                    return const StadiumBorderButton(
                                      onTap: null,
                                      label: 'Cart',
                                      icon: Icons.shopping_cart,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      iconPadding: 16,
                                    );
                                  } else {
                                    return StadiumBorderButton(
                                      onTap: null,
                                      label: 'Cart',
                                      icon: Icons.shopping_cart,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 5,
                                      ),
                                      iconPadding: 16,
                                      action: bd.Badge(
                                        badgeStyle: const bd.BadgeStyle(
                                          shape: bd.BadgeShape.circle,
                                          badgeColor: kcSecondary,
                                          padding: EdgeInsets.all(8),
                                        ),
                                        badgeContent: Text(
                                          '$cartCount',
                                          style: TextStyle(
                                            color: context.primaryColor,
                                          ),
                                        ),
                                        showBadge: cartCount > 0,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                            openBuilder: (_, __) {
                              return const CartView();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 150,
                  vertical: 80,
                ),
                children: [
                  SectionHeader(
                    title: 'Popular Lab Tests',
                    titleStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: context.primaryColor,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  const Gap(37),
                  UnboundedListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const Gap(21),
                    itemBuilder: (_, index) {
                      final bool selected = model.labIndex == index;

                      return ChoiceChip(
                        onSelected: (_) => model.setLabIndex(index),
                        surfaceTintColor: Colors.transparent,
                        selectedColor: context.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          side: BorderSide(
                            color: !selected
                                ? context.primaryColor
                                : Colors.transparent,
                          ),
                        ),
                        label: Text(
                          SampleData().testCategories[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: selected ? kcWhite : context.primaryColor,
                          ),
                        ),
                        selected: selected,
                        showCheckmark: false,
                      );
                    },
                    itemCount: SampleData().testCategories.length,
                  ),
                  const Gap(78),
                  GridView.builder(
                    itemCount: SampleData().labTest.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 65,
                      mainAxisSpacing: 70,
                    ),
                    itemBuilder: (_, index) {
                      final MedicalTest medicalTest =
                          SampleData().labTest[index];

                      return LabTestCard(
                        medicalTest: medicalTest,
                        cartListenable: model.cartListenable,
                        ctaAction: () => model.addToCart(medicalTest),
                        openDetails: () => model.openDetails(medicalTest),
                      );
                    },
                  ),
                  const Gap(78),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Popular Packages',
                      style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                  const Gap(37),
                  UnboundedListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const Gap(21),
                    itemBuilder: (_, index) {
                      final bool selected = model.packageIndex == index;

                      return ChoiceChip(
                        onSelected: (_) => model.setPackageIndex(index),
                        surfaceTintColor: Colors.transparent,
                        selectedColor: context.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          side: BorderSide(
                            color: !selected
                                ? context.primaryColor
                                : Colors.transparent,
                          ),
                        ),
                        label: Text(
                          SampleData().packageCategories[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: selected ? kcWhite : context.primaryColor,
                          ),
                        ),
                        selected: selected,
                        showCheckmark: false,
                      );
                    },
                    itemCount: SampleData().packageCategories.length,
                  ),
                  const Gap(78),
                  GridView.builder(
                    itemCount: SampleData().packages.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.06,
                      crossAxisSpacing: 65,
                      mainAxisSpacing: 70,
                    ),
                    itemBuilder: (_, index) {
                      final MedicalTest package = SampleData().packages[index];

                      return PackageCard(
                        package: package,
                        cartListenable: model.cartListenable,
                        ctaAction: () => model.addToCart(package),
                        onCardTap: () => model.openDetails(package),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
