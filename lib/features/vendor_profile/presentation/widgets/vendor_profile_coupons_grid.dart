import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wad_assignment_manula/core/presentation/shimmers/grid_shimmer.dart';
import 'package:wad_assignment_manula/core/presentation/shimmers/shimmer_builder.dart';
import 'package:wad_assignment_manula/features/vendor_profile/presentation/bloc/vendor_profile_bloc.dart';
import '../../../../core/presentation/error_widget_image.dart';
import '../../../../util/colors.dart';
import '../../../../util/font.dart';
import '../../../../util/injector.dart';

class VendorProfileCouponsGridWrapper extends StatelessWidget {
  final String imagePath;
  final String imagePathCover;
  final int parentCompanyId;

  const VendorProfileCouponsGridWrapper({
    super.key,
    // required this.onTap,
    required this.imagePath,
    required this.imagePathCover,
    required this.parentCompanyId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VendorProfileBloc>(
          create: (context) => sl<VendorProfileBloc>(),
        ),
      ],
      child: VendorProfileCouponsGrid(
        // onTap: onTap,
        imagePath: imagePath,
        imagePathCover: imagePathCover,
        parentCompanyId: parentCompanyId,
      ),
    );
  }
}

class VendorProfileCouponsGrid extends StatefulWidget {
  final String imagePath;
  final String imagePathCover;
  final int parentCompanyId;

  const VendorProfileCouponsGrid({
    super.key,
    required this.imagePath,
    required this.imagePathCover,
    required this.parentCompanyId,
  });

  @override
  State<VendorProfileCouponsGrid> createState() => _VendorProfileCouponsGridState();
}

class _VendorProfileCouponsGridState extends State<VendorProfileCouponsGrid> {
  bool isClickedActive = false;
  bool isGoldPackageOnly = false;
  bool isClockVisible = false;

  // final List<CouponDataEntity> couponObjBluePrint = List.generate(10, (index) => {});

  @override
  void initState() {
    super.initState();
    context.read<VendorProfileBloc>().add(InitialVendorProfileEvent(parentCompanyId: widget.parentCompanyId));
  }

  @override
  Widget build(BuildContext context) {
    VendorProfileBloc vendorProfileBloc = BlocProvider.of<VendorProfileBloc>(context);
    context.read<VendorProfileBloc>().add(InitialVendorProfileEvent(parentCompanyId: widget.parentCompanyId));

    return BlocBuilder<VendorProfileBloc, VendorProfileState>(
      builder: (context, vendorProfileState) {
        var itemCount = vendorProfileState.couponsList.length;

        if (itemCount == 0 &&
            (vendorProfileBloc.state.vendorProfileStatus == VendorProfileStatus.loading ||
                vendorProfileBloc.state.vendorProfileStatus == VendorProfileStatus.initial)) {
          return const GridShimmer();
        } else if (itemCount == 0 && (vendorProfileBloc.state.vendorProfileStatus == VendorProfileStatus.failure)) {
          return ErrorWidgetImage(
            width: 100.w,
            height: 100.h,
            loading: false,
          );
        } else if (itemCount == 0) {
          const Center(child: Text("No items available"));
        }

        return Container(
          color: backgroundColor,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 17.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.8.h,
            ),
            padding: EdgeInsets.all(10.w),
            itemBuilder: (context, index) {
              final vendorProfileCoupon = vendorProfileState.couponsList[index];
              // final vendorProfileCompany = vendorProfileState.companyList;

              return Container(
                width: 176.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 55.h,
                          width: double.infinity,
                          color: kWhiteColor,
                          child: CachedNetworkImage(
                            imageUrl: widget.imagePathCover,
                            placeholder: (context, url) => shimmerLoader(),
                            errorWidget: (context, url, error) => Image.asset('assets/images/cover.png', fit: BoxFit.cover),
                            useOldImageOnUrlChange: true,
                            fit: BoxFit.cover,
                          ),
                          // child: Image.asset('assets/images/cover.png', fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 10.h,
                          left: 10.w,
                          child: Container(
                            width: 70.w,
                            height: 70.h,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: kButtonShadowColor,
                                  offset: const Offset(5, 6),
                                  blurRadius: 14.r,
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: kWhiteColor,
                              radius: 27.0.r,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: widget.imagePath,
                                  placeholder: (context, url) => shimmerLoader(
                                      child: Container(
                                    width: 60.w,
                                    height: 60.h,
                                    decoration: const BoxDecoration(
                                      color: kWhiteColor,
                                      shape: BoxShape.circle,
                                    ),
                                  )),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/images/error_img.png', fit: BoxFit.cover),
                                  useOldImageOnUrlChange: true,
                                  fit: BoxFit.cover,
                                ),
                                // child: Image.asset('assets/images/profile_star.png', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90.h,
                          left: 10.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 170.w,
                                child: Text(
                                  vendorProfileCoupon.title,
                                  style: kBarlow500(context),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    style: kBarlow700(context, color: kPrimaryTextColor),
                                    text: "Save ",
                                  ),
                                  TextSpan(
                                    style: kBarlow700(
                                      context,
                                      color: kPurpleColor,
                                      fontSize: 28.sp,
                                    ),
                                    text: vendorProfileCoupon.value.toString(),
                                  ),
                                  TextSpan(
                                      style: kBarlow300(
                                        context,
                                        color: kPurpleColor,
                                        fontSize: 12.sp,
                                      ),
                                      text: "LKR")
                                ])),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0.h),
                                child: SizedBox(
                                  width: 156.w,
                                  child: Text(
                                    vendorProfileCoupon.description,
                                    style: kPoppins400(
                                      context,
                                      color: kSecondaryTextColor,
                                      fontSize: 14.sp,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 63.h,
                          right: 10.w,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClickedActive = !isClickedActive;
                              });
                              debugPrint('Heart Clicked');
                            },
                            child: SvgPicture.asset(
                              'assets/icons/heart_white_icon.svg',
                              width: 19,
                              height: 19,
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                isClickedActive ? kRedColor : kHeartNotActive,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isClockVisible,
                          child: Positioned(
                            top: 5.h,
                            right: 10.w,
                            child: SvgPicture.asset(
                              'assets/icons/clock_icon.svg',
                              width: 25.w,
                              height: 25.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isGoldPackageOnly,
                          child: Positioned(
                            top: 180.h,
                            left: 0,
                            child: Container(
                              height: 85.h,
                              width: 176.w,
                              color: kCouponGoldPackageBg,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 14.0.h),
                                      child: SvgPicture.asset(
                                        'assets/icons/lock_icon.svg',
                                        width: 30.w,
                                        height: 30.w,
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
                                          kWhiteColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 13.0.h),
                                      child: Text(
                                        'Gold Package Only',
                                        style: kPoppins400(
                                          context,
                                          color: kWhiteColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
