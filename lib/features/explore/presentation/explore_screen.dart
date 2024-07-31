import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_interview_test/features/explore/presentation/widgets/toggle_button.dart';
import '../../../core/presentation/back_button.dart';
import '../../../core/presentation/coupons_grid.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_navbar.dart';
import '../../../core/presentation/divider.dart';
import '../../../core/presentation/sliver_bar_app_delegate.dart';
import '../../../util/colors.dart';
import '../../../util/font.dart';
import '../../vendor_profile/presentation/vendor_profile_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _scrollController = ScrollController();
  bool isBlur = false;
  int selectedIndex = 0;
  bool isLeftActive = true;
  final List<String> categoryNames = [
    "View all",
    "Burgers",
    "Japanese",
  ];

  void toggleCouponGrid(bool isLeft) {
    setState(() {
      isLeftActive = isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: const CustomNavbar(),
      body: Stack(
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                isBlur = notification.direction == ScrollDirection.forward;
              });
              return true;
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: isBlur,
                  delegate: SliverAppBarDelegate(
                    minHeight: 100.h,
                    maxHeight: 100.h,
                    child: CustomHeader(
                      leadWidget: const CustomRoundedButton(icon: "back_icon.svg"),
                      title: "Food and Drinks",
                      centerTitle: true,
                      isBlur: isBlur,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 14.0.h),
                        child: const CustomDivider(),
                      ),
                      CustomAnimatedToggleButton(
                        onToggle: toggleCouponGrid,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 17.0.h),
                        child: const CustomDivider(),
                      ),
                      SizedBox(
                        height: 95.h,
                        child: ListView.builder(
                          itemCount: categoryNames.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected = index == selectedIndex;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  height: 58.h,
                                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                                  decoration: BoxDecoration(
                                    color: isSelected ? kPurpleColor : kWhiteColor,
                                    borderRadius: BorderRadius.all(Radius.circular(29.r)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: isSelected ? kPurpleShadowColor : kButtonShadowColor,
                                        offset: const Offset(4, 3),
                                        blurRadius: isSelected ? 15.r : 4.r,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
                                    child: Center(
                                      child: Text(
                                        categoryNames[index],
                                        style: kPoppins500(
                                          context,
                                          color: isSelected ? kWhiteColor : kPrimaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: CouponsGrid(
                          key: ValueKey<bool>(isLeftActive),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VendorProfileScreen(
                                  imagePath: "assets/images/profile_star.png",
                                  title: "Company Name",
                                ),
                              ),
                            );
                          },
                          showCoupons: isLeftActive,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
