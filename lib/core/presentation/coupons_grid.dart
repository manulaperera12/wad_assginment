import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wad_assignment_manula/core/presentation/shimmers/grid_shimmer.dart';
import 'package:wad_assignment_manula/core/presentation/shimmers/shimmer_builder.dart';
import '../../../../util/colors.dart';
import '../../../../util/font.dart';
import '../../features/explore/presentation/bloc/coupon/coupon_bloc.dart';
import '../../features/explore/presentation/bloc/vendor/vendor_bloc.dart';
import '../../features/vendor_profile/presentation/vendor_profile_screen.dart';
import '../../util/injector.dart';
import 'error_widget_image.dart';

class CouponsGridWrapper extends StatelessWidget {
  // final Function onTap;
  final bool showCoupons;

  const CouponsGridWrapper({
    super.key,
    // required this.onTap,
    this.showCoupons = true,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VendorBloc>(
          create: (context) => sl<VendorBloc>(),
        ),
        BlocProvider<CouponBloc>(
          create: (context) => sl<CouponBloc>(),
        ),
      ],
      child: CouponsGrid(
        // onTap: onTap,
        showCoupons: showCoupons,
      ),
    );
  }
}

class CouponsGrid extends StatefulWidget {
  final bool showCoupons;

  const CouponsGrid({
    super.key,
    required this.showCoupons,
  });

  @override
  State<CouponsGrid> createState() => _CouponsGridState();
}

class _CouponsGridState extends State<CouponsGrid> {
  bool isClickedActive = false;
  bool isGoldPackageOnly = false;
  bool isClockVisible = false;

  // final List<CouponDataEntity> couponObjBluePrint = List.generate(10, (index) => {});

  @override
  void initState() {
    super.initState();
    context.read<CouponBloc>().add(const InitialCouponListEvent());
    context.read<VendorBloc>().add(const GetVendorEventDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    CouponBloc couponBloc = BlocProvider.of<CouponBloc>(context);
    VendorBloc vendorBloc = BlocProvider.of<VendorBloc>(context);
    context.read<CouponBloc>().add((const InitialCouponListEvent()));
    context.read<VendorBloc>().add((const GetVendorEventDataEvent()));

    return BlocBuilder<CouponBloc, CouponState>(
      builder: (context, couponState) {
        return BlocBuilder<VendorBloc, VendorState>(
          builder: (context, vendorState) {
            var itemCount = widget.showCoupons
                ? couponState.couponList.length
                : vendorState.vendorEntity?.parentCompanyDataEntity.length ?? 0;

            if (itemCount == 0 &&
                ((couponBloc.state.status == CouponListStatus.loading || couponBloc.state.status == CouponListStatus.initial) ||
                    (vendorBloc.state.status == VendorStatus.loading || vendorBloc.state.status == VendorStatus.initial))) {
              return const GridShimmer();
            } else if (itemCount == 0 &&
                ((couponBloc.state.status == CouponListStatus.failure) || (vendorBloc.state.status == VendorStatus.failure))) {
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
                  childAspectRatio: widget.showCoupons ? 0.8.h : 0.88.h,
                ),
                padding: EdgeInsets.all(10.w),
                itemBuilder: (context, index) {
                  final coupon = widget.showCoupons ? couponState.couponList[index] : null;
                  final vendor = !widget.showCoupons ? vendorState.vendorEntity?.parentCompanyDataEntity[index] : null;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VendorProfileScreen(
                            imagePath: widget.showCoupons
                                ? "https://staging-admin.slashdeals.lk${coupon?.parentCompanyProfileImg}"
                                : "https://staging-admin.slashdeals.lk${vendor?.profileImg}",
                            title: widget.showCoupons
                                ? (coupon?.parentCompanyName ?? 'N/A')
                                    .split(" ") // Split the name into words
                                    .take(2) // Take the first two words
                                    .join(" ")
                                : (vendor?.name ?? 'N/A')
                                    .split(" ") // Split the name into words
                                    .take(2) // Take the first two words
                                    .join(" "),
                            description: widget.showCoupons ? (coupon?.description ?? "N/A") : (vendor?.description ?? "N/A"),
                            rating: vendor?.rating.toStringAsFixed(1) ?? '4.5',
                            imagePathCover: widget.showCoupons
                                ? "https://staging-admin.slashdeals.lk${coupon?.parentCompanyCoverImg}"
                                : "https://staging-admin.slashdeals.lk${vendor?.coverImg}",
                            id: widget.showCoupons ? coupon?.parentCompanyId ?? -999 : vendor?.parentCompanyId ?? -999,
                          ),
                        ),
                      );
                    },
                    // borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    child: Container(
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
                                  imageUrl: widget.showCoupons
                                      ? "https://staging-admin.slashdeals.lk${coupon?.parentCompanyCoverImg}"
                                      : "https://staging-admin.slashdeals.lk${vendor?.coverImg}",
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
                                        imageUrl: widget.showCoupons
                                            ? "https://staging-admin.slashdeals.lk${coupon?.parentCompanyProfileImg}"
                                            : "https://staging-admin.slashdeals.lk${vendor?.profileImg}",
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
                                        widget.showCoupons
                                            ? (coupon?.parentCompanyName ?? 'N/A')
                                                .split(" ") // Split the name into words
                                                .take(2) // Take the first two words
                                                .join(" ")
                                            : (vendor?.name ?? 'N/A')
                                                .split(" ") // Split the name into words
                                                .take(2) // Take the first two words
                                                .join(" "), // Join them with a space
                                        style: kBarlow500(context),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Visibility(
                                      visible: widget.showCoupons,
                                      child: Padding(
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
                                            text: coupon?.value.toString(),
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 8.0.h, top: !widget.showCoupons ? 10.0.h : 0.0.h),
                                      child: SizedBox(
                                        width: 156.w,
                                        child: Text(
                                          widget.showCoupons ? (coupon?.description ?? "N/A") : (vendor?.address ?? 'N/A'),
                                          style: kPoppins400(
                                            context,
                                            color: kSecondaryTextColor,
                                            fontSize: 14.sp,
                                          ),
                                          maxLines: widget.showCoupons ? 3 : 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: !widget.showCoupons,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.0.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              vendor?.rating.toStringAsFixed(1) ?? 'N/A',
                                              style: kPoppins500(
                                                context,
                                                color: kPrimaryTextColor,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Icon(
                                              Icons.star_rounded,
                                              color: kYellowColor,
                                              size: 25.h,
                                            ),
                                          ],
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
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
