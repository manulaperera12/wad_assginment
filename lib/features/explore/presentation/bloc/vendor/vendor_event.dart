part of 'vendor_bloc.dart';

abstract class VendorEvent extends Equatable {
  const VendorEvent();
}

class GetVendorEventDataEvent extends VendorEvent {
  final bool isRefresh;

  const GetVendorEventDataEvent({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}
