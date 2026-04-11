import 'package:flutter/material.dart';
import 'package:roberto/common/dashboard_layout.dart';
import 'package:roberto/features/Overview/widget/activity_list.dart';
import 'package:roberto/features/Overview/widget/quick_stats.dart';
import 'package:roberto/features/Overview/widget/stat_card.dart';

class OverviewScreen extends StatefulWidget {
  final bool isSystemOwner;
  const OverviewScreen({super.key, this.isSystemOwner = false});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return DashboardLayout(
      activeItem: 'Overview',
      isSystemOwner: widget.isSystemOwner,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dashboard Overview",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Welcome back! Here's what's happening today.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          isDesktop 
            ? Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: widget.isSystemOwner ? "Total Business" : "Total Order Booking",
                      value: "856",
                      trend: "+8.2%",
                      icon: Icons.shopping_cart_outlined,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: StatCard(
                      title: widget.isSystemOwner ? "Active Business" : "Total Messages",
                      value: widget.isSystemOwner ? "750" : "1,234",
                      trend: widget.isSystemOwner ? "" : "+12.5%",
                      icon: Icons.chat_bubble_outline,
                      iconColor: Color(0xff3B82F6),
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Expanded(
                    child: StatCard(
                      title: "Revenue",
                      value: "\$45,678",
                      trend: "+18.7%",
                      icon: Icons.attach_money,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  StatCard(
                    title: widget.isSystemOwner ? "Total Business" : "Total Order Booking",
                    value: "856",
                    trend: "+8.2%",
                    icon: Icons.shopping_cart_outlined,
                  ),
                  const SizedBox(height: 16),
                  StatCard(
                    title: widget.isSystemOwner ? "Active Business" : "Total Messages",
                    value: widget.isSystemOwner ? "750" : "1,234",
                    trend: widget.isSystemOwner ? "" : "+12.5%",
                    icon: Icons.chat_bubble_outline,
                    iconColor: Color(0xff3B82F6),
                  ),
                  const SizedBox(height: 16),
                  const StatCard(
                    title: "Revenue",
                    value: "\$45,678",
                    trend: "+18.7%",
                    icon: Icons.attach_money,
                  ),
                ],
              ),
              
          const SizedBox(height: 32),

          isDesktop 
            ? const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ActivityList(),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: QuickStats(),
                  ),
                ],
              )
            : Column(
                children: [
                  const ActivityList(),
                  const SizedBox(height: 24),
                  const QuickStats(),
                ],
              ),
        ],
      ),
    );
  }
}

