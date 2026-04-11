import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/common/custom_search.dart';
import 'package:roberto/common/sidebar_item.dart';
import 'package:roberto/features/Overview/screen/overview_screen.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  final String activeItem;
  final bool isSystemOwner;

  const DashboardLayout({
    super.key,
    required this.child,
    this.activeItem = 'Overview',
    this.isSystemOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      drawer: isDesktop ? null : _buildSidebar(context),
      body: Row(
        children: [
          if (isDesktop) _buildSidebar(context),
          Expanded(
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 260,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Tugatai Cargo’s",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4A4A4A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                SidebarItem(
                  iconPath: 'assets/overview.svg',
                  label: 'Overview',
                  isActive: activeItem == 'Overview',
                  onTap: () {
                    if (activeItem != 'Overview') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => OverviewScreen(isSystemOwner: isSystemOwner)),
                      );
                    }
                  },
                ),
                SidebarItem(
                  iconPath: 'assets/inbox.svg',
                  label: 'Inbox',
                  isActive: activeItem == 'Inbox',
                  onTap: () {},
                ),
                SidebarItem(
                  iconPath: 'assets/order.svg',
                  label: 'Order Booking',
                  isActive: activeItem == 'Order Booking',
                  onTap: () {},
                ),
                SidebarItem(
                  iconPath:'assets/aiagent.svg',
                  label: 'AI Agent',
                  isActive: activeItem == 'AI Agent',
                  onTap: () {},
                ),
                SidebarItem(
                  iconPath: 'assets/pricing.svg',
                  label: 'Pricing',
                  isActive: activeItem == 'Pricing',
                  onTap: () {},
                ),
                SidebarItem(
                  iconPath: 'assets/crm.svg',
                  label: 'CRM & Leads',
                  isActive: activeItem == 'CRM & Leads',
                  onTap: () {},
                ),
                SidebarItem(
                  iconPath: 'assets/subscription.svg',
                  label: 'Subscriptions',
                  isActive: activeItem == 'Subscriptions',
                  onTap: () {},
                ),
                SidebarItem(
                  iconPath: 'assets/setting.svg',
                  label: 'Settings',
                  isActive: activeItem == 'Settings',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xffEEEEEE)),
        ),
      ),
      child: Row(
        children: [
          // Mobile Menu Button
          if (MediaQuery.of(context).size.width <= 900)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          CustomSearch(),
          const Spacer(),
          // Notification
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined, color: Colors.grey),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // User Profile
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Color(0xff4F46E5),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "John Doe",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
