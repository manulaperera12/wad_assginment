part of 'vendor_bloc.dart';

enum VendorStatus { initial, loading, success, failure }


class VendorState extends Equatable {
  final VendorStatus status;
  final String? errorMessage;
  final VendorEntity? vendorEntity;

  const VendorState({
    this.status = VendorStatus.initial,
    this.errorMessage,
    this.vendorEntity,
  });

  @override
  List<Object?> get props => [status, errorMessage, vendorEntity];

  VendorState copyWith({
    VendorStatus? status,
    String? errorMessage,
    VendorEntity? vendorEntity,
  }) {
    return VendorState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      vendorEntity: vendorEntity ?? this.vendorEntity,
    );
  }
}
