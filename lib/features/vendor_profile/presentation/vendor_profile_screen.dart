import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wad_assignment_manula/features/vendor_profile/presentation/widgets/vendor_profile_coupons_grid.dart';
import '../../../core/presentation/bounce_widget.dart';
import '../../../util/colors.dart';
import '../../../util/font.dart';

class VendorProfileScreen extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final String imagePathCover;
  final String rating;
  final int id;

  const VendorProfileScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.rating,
    required this.imagePathCover,
    required this.id,
  });

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen> {
  bool isClickedActive = true; // to track which side is active
  final List<dynamic> couponObjBluePrint = List.generate(10, (index) => {});
  int selectedIndex = 0;
  final List<String> tabNames = [
    "Coupons",
    "Information",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            // height: 1.sh,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 56.h, bottom: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Vendor logo
                        Padding(
                          padding: EdgeInsets.only(left: 28.0.w),
                          child: Container(
                            width: 102.w,
                            height: 102.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: kHeartNotActive, offset: Offset(5.w, 6.h), blurRadius: 14.r, spreadRadius: 0)
                              ],
                              color: kWhiteColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(11.0.w),
                              child: CircleAvatar(
                                backgroundColor: kWhiteColor,
                                radius: 27.0.r,
                                child: Image.network(
                                  widget.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /// Company details
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 11.0.h, bottom: 8.0.h),
                                    child: Text(
                                      widget.title,
                                      style: kBarlow500(
                                        context,
                                        fontSize: 24.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.6.sw,
                                    child: Text(
                                      widget.description,
                                      style: kPoppins400(
                                        context,
                                        fontSize: 14.sp,
                                        color: kVendorShopDesTextColor,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              /// Rating
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Container(
                                  // height: 58.h,
                                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                                  decoration: BoxDecoration(
                                    color: kPurpleColor,
                                    borderRadius: BorderRadius.all(Radius.circular(37.r)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kPurpleShadowColor,
                                        offset: const Offset(4, 6),
                                        blurRadius: 18.r,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
                                    child: Center(
                                      child: Text(
                                        widget.rating,
                                        style: kPoppins500(
                                          context,
                                          color: kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // tabs
                        Padding(
                          padding: EdgeInsets.only(top: 23.0.h),
                          child: SizedBox(
                            height: 95.h,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tabNames.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(left: 23.w),
                              itemBuilder: (BuildContext context, int index) {
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
                                      // Duration of the color transition
                                      curve: Curves.easeInOut,
                                      // Type of animation curve to make the transition smooth
                                      height: 58.h,
                                      width: 161.w,

                                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                                      decoration: BoxDecoration(
                                        color: isSelected ? kPurpleColor : backgroundColor,
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
                                            tabNames[index],
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
                        ),
                      ],
                    ),
                  ),

                  /// coupon grid
                  VendorProfileCouponsGridWrapper(
                    imagePathCover: widget.imagePathCover,
                    imagePath: widget.imagePath,
                    parentCompanyId: widget.id,
                  ),
                ],
              ),
            ),
          ),

          /// Close button
          SizedBox(
            height: 150.h,
            width: 1.sw,
            child: Stack(
              // clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 60.h, // Adjust to your needs
                  right: 20.w, // Adjust to your needs
                  child: Bounce(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: SvgPicture.asset(
                      "assets/icons/yellow_close_icon.svg",
                      width: 44.w, // Icon size, adjust as needed
                      height: 44.h, // Icon size, adjust as needed
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
