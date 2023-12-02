import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:healthcheck/constants/app_extensions.dart';
import 'package:healthcheck/viewmodels/home_view_model.dart';
import 'package:healthcheck/views/cart_view.dart';
import 'package:healthcheck/widgets/custom_open_container.dart';
import 'package:healthcheck/widgets/default_system_overlay.dart';
import 'package:healthcheck/widgets/lab_test_card.dart';
import 'package:healthcheck/widgets/package_card.dart';
import 'package:healthcheck/widgets/section_header.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return DefaultSystemOverlay(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Health Check'),
              actions: [
                CustomOpenContainer(closedBuilder: (_, __) {
                  return IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: context.primaryColor,
                    ),
                  );
                }, openBuilder: (_, __) {
                  return const CartView();
                }),
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
                  itemCount: 4,
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
                    return LabTestCard(
                      ctaAction: () => model.addToCart(),
                    );
                  },
                ),
                Gap(3.2.h),
                const SectionHeader(
                  title: 'Popular Packages',
                ),
                SizedBox(
                  height: 35.h,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 5.w,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return const PackageCard();
                    },
                    separatorBuilder: (_, __) {
                      return Gap(5.w);
                    },
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
