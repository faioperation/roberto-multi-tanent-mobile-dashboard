import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  confirmed,
  delivered,
}

class OrderModel {
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

  OrderModel({
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
}
