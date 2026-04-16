import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/common/custom_search.dart';
import 'package:roberto/common/sidebar_item.dart';
import 'package:roberto/features/Inbox/widget/chat_details.dart';
import 'package:roberto/features/Inbox/widget/chat_list.dart';
import 'package:roberto/features/Inbox/widget/chat_view.dart';
import 'package:roberto/features/Overview/widget/activity_list.dart';
import 'package:roberto/features/Overview/widget/quick_stats.dart';
import 'package:roberto/features/Overview/widget/stat_card.dart';
import 'package:roberto/features/Tenant Management /screen/tenant_screen.dart';
import 'package:roberto/features/Subscription/screen/subscription_screen.dart';
import 'package:roberto/features/Settings/screen/setting_screen.dart';
import 'package:roberto/features/Orderbooking/screen/order_booking_screen.dart';
import 'package:roberto/features/Inbox/screen/inbox_screen.dart';

class DashboardShell extends StatefulWidget {
  final bool isSystemOwner;

  const DashboardShell({super.key, this.isSystemOwner = false});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  String _activeItem = 'Overview';

  void _selectItem(String item) {
    setState(() {
      _activeItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      drawer: isDesktop ? null : Drawer(child: _buildSidebar(context)),
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
                    child: _buildContent(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    switch (_activeItem) {
      case 'Inbox':
        return InboxScreen(isSystemOwner: widget.isSystemOwner);
      case 'Tenant Management':
        return const TenantScreen();
      case 'Subscriptions':
        return const SubscriptionScreen();

      case 'Settings':
        return const SettingScreen();

      case 'Order Booking':
        return const OrderBookingScreen();

      case 'Overview':
      default:
        return _buildOverviewContent(context, isDesktop);
    }
  }

  // ─── Overview Content ───────────────────────────────────────────────────────

  Widget _buildOverviewContent(BuildContext context, bool isDesktop) {
    return Column(
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
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 32),

        isDesktop
            ? Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: widget.isSystemOwner
                          ? "Total Business"
                          : "Total Order Booking",
                      value: "856",
                      trend: "+8.2%",
                      icon: Icons.shopping_cart_outlined,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: StatCard(
                      title: widget.isSystemOwner
                          ? "Active Business"
                          : "Total Messages",
                      value: widget.isSystemOwner ? "750" : "1,234",
                      trend: widget.isSystemOwner ? "" : "+12.5%",
                      icon: Icons.chat_bubble_outline,
                      iconColor: const Color(0xff3B82F6),
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
                    title: widget.isSystemOwner
                        ? "Total Business"
                        : "Total Order Booking",
                    value: "856",
                    trend: "+8.2%",
                    icon: Icons.shopping_cart_outlined,
                  ),
                  const SizedBox(height: 16),
                  StatCard(
                    title: widget.isSystemOwner
                        ? "Active Business"
                        : "Total Messages",
                    value: widget.isSystemOwner ? "750" : "1,234",
                    trend: widget.isSystemOwner ? "" : "+12.5%",
                    icon: Icons.chat_bubble_outline,
                    iconColor: const Color(0xff3B82F6),
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
                  Expanded(flex: 2, child: ActivityList()),
                  SizedBox(width: 24),
                  Expanded(flex: 1, child: QuickStats()),
                ],
              )
            : const Column(
                children: [
                  ActivityList(),
                  SizedBox(height: 24),
                  QuickStats(),
                ],
              ),
      ],
    );
  }

  // ─── Sidebar ─────────────────────────────────────────────────────────────

  Widget _buildSidebar(BuildContext context) {
    final systemOwnerItems = [
      {'icon': 'assets/overview.svg', 'label': 'Overview'},
      {'icon': 'assets/subscription.svg', 'label': 'Tenant Management'},
      {'icon': 'assets/subscription.svg', 'label': 'Subscriptions'},
      {'icon': 'assets/setting.svg', 'label': 'Settings'},
    ];

    final businessOwnerItems = [
      {'icon': 'assets/overview.svg', 'label': 'Overview'},
      {'icon': 'assets/inbox.svg', 'label': 'Inbox'},
      {'icon': 'assets/order.svg', 'label': 'Order Booking'},
      {'icon': 'assets/aiagent.svg', 'label': 'AI Agent'},
      {'icon': 'assets/pricing.svg', 'label': 'Pricing'},
      {'icon': 'assets/crm.svg', 'label': 'CRM & Leads'},
      {'icon': 'assets/subscription.svg', 'label': 'Subscriptions'},
      {'icon': 'assets/setting.svg', 'label': 'Settings'},
    ];

    final items =
        widget.isSystemOwner ? systemOwnerItems : businessOwnerItems;

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
                SvgPicture.asset('assets/logo.svg', height: 60),
                const SizedBox(height: 10),
                const Text(
                  "Tugatai Cargo's",
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
              children: items.map((item) {
                final label = item['label']!;
                return SidebarItem(
                  iconPath: item['icon']!,
                  label: label,
                  isActive: _activeItem == label,
                  onTap: () {
                    _selectItem(label);
                    // Close drawer on mobile after selection
                    if (MediaQuery.of(context).size.width <= 900) {
                      Navigator.pop(context);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Top Bar ─────────────────────────────────────────────────────────────

  Widget _buildTopBar(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width <= 900;

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xffEEEEEE))),
      ),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          if (!isMobile) CustomSearch() else const Spacer(),

          if (isMobile)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.grey),
              onPressed: () {},
            ),

          if (!isMobile) const Spacer(),

          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined,
                    color: Colors.grey),
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
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 10),
                const Text(
                  "John Doe",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
                const Icon(Icons.keyboard_arrow_down,
                    size: 20, color: Colors.grey),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
