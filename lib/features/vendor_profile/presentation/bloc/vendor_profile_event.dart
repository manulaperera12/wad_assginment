part of 'vendor_profile_bloc.dart';

abstract class VendorProfileEvent extends Equatable {
  const VendorProfileEvent();
}

class InitialVendorProfileEvent extends VendorProfileEvent {
  final int parentCompanyId;
  final bool isRefresh;

  const InitialVendorProfileEvent({
    required this.parentCompanyId,
    this.isRefresh = false,
  });

  @override
  List<Object> get props => [parentCompanyId, isRefresh];
}
