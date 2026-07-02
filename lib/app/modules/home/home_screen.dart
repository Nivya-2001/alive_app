import 'package:alive_app/app/core/sizes/responsive_extension.dart';
import 'package:alive_app/app/core/theme/app_colors.dart';
import 'package:alive_app/app/widgets/badge_icon_widget.dart';
import 'package:alive_app/app/widgets/custom_appbar.dart';
import 'package:alive_app/app/widgets/custom_text_widget.dart';
import 'package:alive_app/app/widgets/stream_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            BadgeIconWidget(
              icon: Icons.notifications_none_rounded,
              badgeCount: '3',
              iconColor: Colors.black54,
              onTap: () {
                // open notifications
              },
            ),
            GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: EdgeInsets.all(8.dp),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.wallet_rounded,
                  color: Colors.white,
                  size: 20.dp,
                ),
              ),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              _buildTabs(),
              Padding(
                padding: EdgeInsets.only(bottom: 12.dp),
                child: _buildRegionChips(),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.dp),
                      itemCount: controller.streams.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 0.62,
                        crossAxisSpacing: 10.dp,
                        mainAxisSpacing: 10.dp,
                      ),
                      itemBuilder: (context, index) =>
                          StreamCard(stream: controller.streams[index]),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(16.dp),
        child: Row(
          children: ['Stream', 'Hot', 'Follow'].map((tab) {
            final isActive = controller.selectedTab.value == tab;
            return GestureDetector(
              onTap: () => controller.changeTab(tab),
              child: Padding(
                padding: EdgeInsetsGeometry.only(right: 12.dp),
                child: CustomTextWidget(
                  text: tab,
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: isActive ? AppColors.primaryGreen : Colors.grey,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRegionChips() {
    final regions = ['Global', 'India', 'Philippines', 'Brazil'];
    return SizedBox(
      height: 32.dp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.dp),
        itemCount: regions.length,
        itemBuilder: (context, index) {
          final region = regions[index];
          return Obx(() {
            final isActive = controller.selectedRegion.value == region;
            return Container(
              padding: EdgeInsets.symmetric(vertical: 4.dp, horizontal: 12.dp),
              margin: EdgeInsets.only(right: 8.dp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isActive ? AppColors.lightGreen : Colors.white,
                border: Border.all(
                  color: isActive
                      ? AppColors.primaryGreen
                      : Colors.grey.shade300,
                  width: 1.dp,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.dp)),
              ),
              child: CustomTextWidget(
                text: region,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isActive ? Colors.white : Colors.grey.shade500,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
