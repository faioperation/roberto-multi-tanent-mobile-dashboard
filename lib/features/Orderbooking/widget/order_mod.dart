import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  confirmed,
  delivered,
}

class OrderMod {
  final String orderId;
  final String customerName;
  final String phone;
  final String address;
  final OrderStatus status;
  final String courier;
  final double shippingCharge;
  final String deliveryTime;
  final String avatarInitials;
  final Color avatarColor;

  OrderMod({
    required this.orderId,
    required this.customerName,
    required this.phone,
    required this.address,
    required this.status,
    required this.courier,
    required this.shippingCharge,
    required this.deliveryTime,
    required this.avatarInitials,
    required this.avatarColor,
  });

  OrderMod copyWith({
    String? orderId,
    String? customerName,
    String? phone,
    String? address,
    OrderStatus? status,
    String? courier,
    double? shippingCharge,
    String? deliveryTime,
    String? avatarInitials,
    Color? avatarColor,
  }) {
    return OrderMod(
      orderId: orderId ?? this.orderId,
      customerName: customerName ?? this.customerName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      status: status ?? this.status,
      courier: courier ?? this.courier,
      shippingCharge: shippingCharge ?? this.shippingCharge,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      avatarInitials: avatarInitials ?? this.avatarInitials,
      avatarColor: avatarColor ?? this.avatarColor,
    );
  }
}
