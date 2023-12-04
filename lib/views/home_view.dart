import 'package:badges/badges.dart' as bd;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/data/sample_data.dart';
import 'package:healthcheck/models/medical_test.dart';
import 'package:healthcheck/viewmodels/home_view_model.dart';
import 'package:healthcheck/views/cart_view.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/lab_test_card.dart';
import 'package:healthcheck/widgets/package_card.dart';
import 'package:healthcheck/widgets/section_header.dart';
import 'package:healthcheck/widgets/unbounded_list_view.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initializeModel(),
      builder: (context, model, _) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                color: context.primaryColor,
                icon: context.isDarkEnabled
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
                onPressed: () => model.switchThemes(),
              ),
              centerTitle: true,
              title: const Text('Health Check'),
              surfaceTintColor: context.scaffoldBackgroundColor,
              actions: [
                IconButton(
                  onPressed: () => model.openUserHistory(),
                  icon: const Icon(Icons.history),
                  color: context.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: ValueListenableBuilder(
                    valueListenable: model.cartListenable,
                    builder: (context, value, _) {
                      return bd.Badge(
                        showBadge: value.length != 0,
                        position: bd.BadgePosition.topEnd(
                          end: 5,
                          top: 0,
                        ),
                        badgeStyle: bd.BadgeStyle(
                          padding: EdgeInsets.all(1.w),
                        ),
                        badgeContent: Text(
                          value.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                        child: CustomOpenContainer(
                          closedBuilder: (_, __) {
                            return IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.shopping_cart,
                                color: context.primaryColor,
                              ),
                            );
                          },
                          openBuilder: (_, __) {
                            return const CartView();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              physics: const BouncingScrollPhysics(),
              children: [
                const SectionHeader(
                  title: 'Popular Lab Tests',
                  action: 'View All',
                ),
                Gap(4.h),
                GridView.builder(
                  itemCount: SampleData().labTest.length,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.3.h,
                    crossAxisSpacing: 8.26.w,
                    childAspectRatio: 0.73,
                  ),
                  itemBuilder: (_, index) {
                    MedicalTest medicalTest = SampleData().labTest[index];

                    return LabTestCard(
                      ctaAction: () => model.addToCart(medicalTest),
                      medicalTest: medicalTest,
                      cartListenable: model.cartListenable,
                      openDetails: () => model.openDetails(
                        medicalTest,
                      ),
                    );
                  },
                ),
                Gap(3.2.h),
                const SectionHeader(
                  title: 'Popular Packages',
                ),
                UnboundedListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 5.w,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    MedicalTest package = SampleData().packages[index];
                    final bool inCart = model.cart.contains(package);

                    return PackageCard(
                      package: package,
                      cartListenable: model.cartListenable,
                      onCardTap: () => model.openDetails(
                        package,
                        isPackage: true,
                        inCart: inCart,
                      ),
                      ctaAction: () => model.addToCart(package),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return Gap(5.w);
                  },
                  itemCount: SampleData().packages.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
