import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/notification/widget/custom_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width <= 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffD2D2D2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '10 notifications',
            style: TextStyle(
              fontSize: isMobile ? 13 : 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          const CustomNotification(
            svgPath: "assets/on.svg",
            title: "New Order Received",
            subtitle: "Order #TGT-12345678 from Sarah Johnson has been placed",
            time: "2 minutes ago",
            showDot: true,
          ),
          const CustomNotification(
            svgPath: "assets/bn.svg",
            title: "Booking Confirmed",
            subtitle: "Michael Chen's booking for April 15, 2026 at 10:00 AM",
            time: "15 minutes ago",
            showDot: true,
          ),
          const CustomNotification(
            svgPath: "assets/mn.svg",
            title: "New Message on WhatsApp",
            subtitle: "Emma Wilson: Can you provide a quote for my shipment?",
            time: "1 hour ago",
            showDot: true,
          ),
          const CustomNotification(
            svgPath: "assets/on.svg",
            title: "Order Status Updated",
            subtitle: "Order #TGT-23456789 status changed to In Transit",
            time: "2 hours ago",
          ),
          const CustomNotification(
            svgPath: "assets/bn.svg",
            title: "Booking Request",
            subtitle: "New booking request from James Rodriguez",
            time: "3 hours ago",
          ),
          const CustomNotification(
            svgPath: "assets/sn.svg",
            title: "System Update",
            subtitle: "Pricing engine has been updated with new rates",
            time: "5 hours ago",
          ),
        ],
      ),
    );
  }
}