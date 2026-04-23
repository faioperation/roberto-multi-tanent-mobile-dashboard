import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/common/sidebar_item.dart';
import 'package:roberto/features/Tenant Management /screen/tenant_screen.dart';
import 'package:roberto/features/Subscription/screen/subscription_screen.dart';
import 'package:roberto/features/Settings/screen/setting_screen.dart';
import 'package:roberto/features/Orderbooking/screen/order_booking_screen.dart';
import 'package:roberto/features/Inbox/screen/inbox_screen.dart';
import 'package:roberto/features/AiAgent/screen/aiagent_screen.dart';
import 'package:roberto/features/Pricing/screen/pricing_screen.dart';
import 'package:roberto/features/CRM/screen/cmr_screen.dart';
import 'package:roberto/features/notification/screen/notification_screen.dart';
import 'package:roberto/features/management/screen/management_screen.dart';
import 'package:roberto/features/businesssetting/screen/businessowner_settings.dart';
import 'package:roberto/features/businesssubscription/screen/business_subscription.dart';
import 'package:roberto/features/Auth/screen/login_screen.dart';
import 'package:roberto/features/Overview/screen/overview_screen.dart';


class DashboardShell extends StatefulWidget {
  final bool isSystemOwner;

  const DashboardShell({super.key, this.isSystemOwner = false});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  String _activeItem = 'Overview';
  
  final List<Map<String, String>> _branches = [
    {"name": "Queens Center", "address": "719/B, Queens, NY"},
    {"name": "Brooklyn Hub", "address": "123, Brooklyn, NY"},
    {"name": "Manhattan Store", "address": "456, Manhattan, NY"},
  ];
  late Map<String, String> _selectedBranch = _branches[0];

  void _selectItem(String item) {
    setState(() {
      _activeItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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

    switch (_activeItem) {
      case 'Inbox':
        return InboxScreen(isSystemOwner: widget.isSystemOwner);
      case 'Tenant Management':
        return const TenantScreen();

      case 'Subscriptions':
        return widget.isSystemOwner
            ? const SubscriptionScreen()
            : const BusinessSubscription();

      case 'Settings':
        return widget.isSystemOwner
            ? const SettingScreen()
            : const BusinessownerSettings();

      case 'Order Booking':
        return const OrderBookingScreen();

      case 'AI Agent':
        return const AiagentScreen();

      case 'Pricing':
        return const PricingScreen();

      case 'CRM & Leads':
        return const CmrScreen();

      case 'Management':
        return const ManagementScreen();

      case 'Notifications':
        return const NotificationScreen();

      case 'Edit Profile':
        return const SettingScreen();

      case 'Overview':
      default:
        return OverviewScreen(isSystemOwner: widget.isSystemOwner);
    }
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
      {'icon': 'assets/management.svg', 'label': 'Management'},
      {'icon': 'assets/setting.svg', 'label': 'Settings'},
    ];

    final items =
        widget.isSystemOwner ? systemOwnerItems : businessOwnerItems;

    return Container(
      width: 260,
      color: Theme.of(context).cardTheme.color,
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
                  "Roberto Cargo's",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (!widget.isSystemOwner) ...[
            const SizedBox(height: 16),
            Divider(color: Theme.of(context).dividerTheme.color, height: 1, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Theme(
                data: Theme.of(context).copyWith(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: PopupMenuButton<Map<String, String>>(
                  offset: const Offset(0, 50),
                  position: PopupMenuPosition.under,
                  color: Theme.of(context).cardTheme.color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  onSelected: (Map<String, String> branch) {
                    setState(() {
                      _selectedBranch = branch;
                    });
                  },
                  itemBuilder: (context) => _branches.map((branch) {
                    return PopupMenuItem<Map<String, String>>(
                      value: branch,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            branch['name']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: branch == _selectedBranch ? FontWeight.bold : FontWeight.normal,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            branch['address']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                          if (branch != _branches.last)
                            const Divider(height: 16),
                        ],
                      ),
                    );
                  }).toList(),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined, color: AppColor.primary, size: 22),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedBranch['name']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _selectedBranch['address']!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ] else ...[
            const SizedBox(height: 32),
          ],
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
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width <= 900;
    final bool isSmallMobile = width <= 600;

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: isSmallMobile ? 12 : 24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerTheme.color ?? const Color(0xffEEEEEE))),
      ),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          if (isMobile && !isSmallMobile)
            IconButton(
              icon: const Icon(Icons.search, color: AppColor.grey),
              onPressed: () {
                // Future: show search bar overlay
              },
            ),

          const Spacer(),

          // Notifications
          _buildNotificationIcon(),

          const SizedBox(width: 16),

          // User Profile
          _buildUserProfile(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined,
              color: AppColor.grey),
          onPressed: () {
            _selectItem('Notifications');
          },
        ),
        Positioned(
          right: 6,
          top: 6,
          child: IgnorePointer(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColor.primary,
                shape: BoxShape.circle,
              ),
              child: const Text(
                "3",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserProfile(BuildContext context, bool isMobile) {
    return PopupMenuButton<String>(
      color: Theme.of(context).cardTheme.color,
      padding: EdgeInsets.zero,
      offset: const Offset(0, 45),
      onSelected: (value) {
        if (value == 'logout') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginScreen()),
          );
        } else if (value == 'profile') {
          _selectItem('Edit Profile');
        }
      },
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<String>>[
        if (!widget.isSystemOwner)
          const PopupMenuItem<String>(
            value: 'profile',
            child: Row(
              children: [
                Icon(Icons.person_outline, size: 18),
                SizedBox(width: 8),
                Text('Edit Profile', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, size: 18, color:  AppColor.primary),
              SizedBox(width: 8),
              Text('Logout',
                  style:
                      TextStyle(color: AppColor.primary, fontSize: 14)),
            ],
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: AppColor.mini,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.person, color: AppColor.white, size: 18),
              ),
            ),
            if (!isMobile) ...[
              const SizedBox(width: 10),
              const Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
