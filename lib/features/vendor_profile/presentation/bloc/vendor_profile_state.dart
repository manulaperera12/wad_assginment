part of 'vendor_profile_bloc.dart';

enum VendorProfileStatus { initial, loading, success, failure }

class VendorProfileState extends Equatable {
  final VendorProfileStatus vendorProfileStatus;
  final List<CompanyEntity> companyList;
  final List<VendorProfileCouponsEntity> couponsList;
  final String? errorMessage;

  const VendorProfileState({
    this.vendorProfileStatus = VendorProfileStatus.initial,
    this.companyList = const [],
    this.couponsList = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        vendorProfileStatus,
        companyList,
        couponsList,
        errorMessage,
      ];

  VendorProfileState copyWith({
    VendorProfileStatus? vendorProfileStatus,
    List<CompanyEntity>? companyList,
    List<VendorProfileCouponsEntity>? couponsList,
    String? errorMessage,
  }) {
    return VendorProfileState(
      vendorProfileStatus: vendorProfileStatus ?? this.vendorProfileStatus,
      companyList: companyList ?? this.companyList,
      couponsList: couponsList ?? this.couponsList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
