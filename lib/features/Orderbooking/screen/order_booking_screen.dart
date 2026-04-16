import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_stat_card.dart';
import 'package:roberto/features/Orderbooking/widget/order_mod.dart';
import 'package:roberto/features/Orderbooking/widget/custom_orders.dart';
import 'package:roberto/features/Orderbooking/widget/custom_viewdetails.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';
import 'package:table_calendar/table_calendar.dart';

// Breakpoint
const double _kDesktop = 700;

class OrderBookingScreen extends StatefulWidget {
  const OrderBookingScreen({super.key});

  @override
  State<OrderBookingScreen> createState() => _OrderBookingScreenState();
}

class _OrderBookingScreenState extends State<OrderBookingScreen> {
  int selectedIndex = 0;

  String _searchQuery = '';
  String _selectedStatus = 'All status';
  String _selectedTime = 'All time';

  // Calendar State
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  final List<OrderMod> _orders = [
    OrderMod(
      orderId: '#ORD-001',
      customerName: 'Sarah Johnson',
      phone: '+1 (555) 123-4567',
      address: 'Texas to New York',
      status: OrderStatus.pending,
      courier: 'Not assigned',
      shippingCharge: 45.00,
      deliveryTime: '12 Apr, 9:00 PM',
      avatarInitials: 'SJ',
      avatarColor: const Color(0xFF3B6D11),
    ),
    OrderMod(
      orderId: '#ORD-002',
      customerName: 'Emma Wilson',
      phone: '+1 (555) 123-4567',
      address: 'Texas to New York',
      status: OrderStatus.confirmed,
      courier: 'FedEx',
      shippingCharge: 19.50,
      deliveryTime: '12 Apr, 9:00 PM',
      avatarInitials: 'EW',
      avatarColor: const Color(0xFF185FA5),
    ),
    OrderMod(
      orderId: '#ORD-003',
      customerName: 'David Brown',
      phone: '+1 (555) 123-4567',
      address: 'Texas to New York',
      status: OrderStatus.delivered,
      courier: 'UPS',
      shippingCharge: 67.00,
      deliveryTime: '12 Apr, 9:00 PM',
      avatarInitials: 'DB',
      avatarColor: const Color(0xFF72243E),
    ),
    OrderMod(
      orderId: '#ORD-004',
      customerName: 'Sarah Johnson',
      phone: '+1 (555) 123-4567',
      address: 'Texas to New York',
      status: OrderStatus.confirmed,
      courier: 'DHL',
      shippingCharge: 23.99,
      deliveryTime: '12 Apr, 9:00 PM',
      avatarInitials: 'SJ',
      avatarColor: const Color(0xFF3B6D11),
    ),
    OrderMod(
      orderId: '#ORD-005',
      customerName: 'Emma Wilson',
      phone: '+1 (555) 123-4567',
      address: 'Texas to New York',
      status: OrderStatus.pending,
      courier: 'Not assigned',
      shippingCharge: 80.00,
      deliveryTime: '12 Apr, 9:00 PM',
      avatarInitials: 'EW',
      avatarColor: const Color(0xFF185FA5),
    ),
  ];

  List<OrderMod> get _filteredOrders {
    return _orders.where((order) {
      final matchesSearch = _searchQuery.isEmpty ||
          order.orderId.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          order.customerName.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesStatus = _selectedStatus == 'All status' ||
          (_selectedStatus == 'Pending' &&
              order.status == OrderStatus.pending) ||
          (_selectedStatus == 'Confirmed' &&
              order.status == OrderStatus.confirmed) ||
          (_selectedStatus == 'Delivered' &&
              order.status == OrderStatus.delivered);

      return matchesSearch && matchesStatus;
    }).toList();
  }

  //BUILD
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < _kDesktop;
        return SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(isMobile),
              SizedBox(height: isMobile ? 16 : 24),
              _buildStatCards(isMobile),
              SizedBox(height: isMobile ? 14 : 20),
              if (selectedIndex == 0) ...[
                _buildFilterBar(isMobile),
                SizedBox(height: isMobile ? 12 : 16),
                isMobile ? _buildMobileCards() : _buildDesktopTable(),
              ] else
                _buildCalendarContent(isMobile),
            ],
          ),
        );
      },
    );
  }

  // HEADER
  Widget _buildHeader(bool isMobile) {
    final titleCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Booking',
          style: TextStyle(
            fontSize: isMobile ? 20 : 26,
            fontWeight: FontWeight.bold,
            color: const Color(0xff111827),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Track and manage all customer orders',
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: const Color(0xff6B7280),
          ),
        ),
      ],
    );

    final actionRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Toggle
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildToggleTab(
                  label: isMobile ? 'Table' : 'Table View', index: 0),
              _buildToggleTab(
                  label: isMobile ? 'Calendar' : 'Calendar View',
                  index: 1,
                  icon: Icons.calendar_today),
            ],
          ),
        ),
        const SizedBox(width: 10),
        // New Booking button
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 16,
              vertical: isMobile ? 10 : 12,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
          ),
          icon: const Icon(Icons.add, size: 16),
          label: Text(
            isMobile ? 'New' : 'new Booking',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
      ],
    );

    if (isMobile) {
      // Mobile: stack title on top, actions below
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleCol,
          const SizedBox(height: 12),
          actionRow,
        ],
      );
    }

    // Desktop: side-by-side
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [titleCol, actionRow],
    );
  }

  // ─── STAT CARDS ─────────────────────────────────────────────────────
  Widget _buildStatCards(bool isMobile) {
    final cards = [
      CustomStatCard(
          label: 'Total Orders', value: '856', iconPath: 'assets/order1.svg'),
      CustomStatCard(
          label: 'Pending', value: '124', iconPath: 'assets/pending.svg'),
      CustomStatCard(
          label: 'Confirmed', value: '89', iconPath: 'assets/confirm.svg'),
      CustomStatCard(
          label: 'Delivered', value: '643', iconPath: 'assets/deliver.svg'),
    ];

    if (!isMobile) {
      // Desktop: 4 columns
      return Row(
        children: cards.asMap().entries.map((e) {
          return Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(right: e.key < cards.length - 1 ? 16 : 0),
              child: e.value,
            ),
          );
        }).toList(),
      );
    }

    // Mobile: 2×2 grid
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child:
                    Padding(padding: const EdgeInsets.only(right: 8), child: cards[0])),
            Expanded(child: cards[1]),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child:
                    Padding(padding: const EdgeInsets.only(right: 8), child: cards[2])),
            Expanded(child: cards[3]),
          ],
        ),
      ],
    );
  }

  //FILTER BAR
  Widget _buildFilterBar(bool isMobile) {
    final searchField = Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 18, color: Colors.grey.shade400),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search orders...',
                hintStyle:
                    TextStyle(fontSize: 14, color: Colors.grey.shade400),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );

    final statusDrop = _buildFilterDropdown(
      value: _selectedStatus,
      items: ['All status', 'Pending', 'Confirmed', 'Delivered'],
      onChanged: (v) => setState(() => _selectedStatus = v ?? 'All status'),
    );

    final timeDrop = _buildFilterDropdown(
      value: _selectedTime,
      items: ['All time', 'Today', 'This week', 'This month'],
      onChanged: (v) => setState(() => _selectedTime = v ?? 'All time'),
    );

    Widget content;
    if (isMobile) {
      // Mobile: search full width, dropdowns in a row below
      content = Column(
        children: [
          SizedBox(width: double.infinity, child: searchField),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: statusDrop),
              const SizedBox(width: 10),
              Expanded(child: timeDrop),
            ],
          ),
        ],
      );
    } else {
      // Desktop: everything in one row
      content = Row(
        children: [
          Expanded(child: searchField),
          const SizedBox(width: 12),
          statusDrop,
          const SizedBox(width: 12),
          timeDrop,
        ],
      );
    }

    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0xffF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: content,
    );
  }

  //DESKTOP TABLE
  Widget _buildDesktopTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // Header row
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              color: const Color(0xffFEE2E2),
              child: const Row(
                children: [
                  Expanded(flex: 2, child: CustomHeadder(label: 'Order ID')),
                  Expanded(flex: 3, child: CustomHeadder(label: 'Customer')),
                  Expanded(flex: 3, child: CustomHeadder(label: 'Address')),
                  Expanded(flex: 2, child: CustomHeadder(label: 'Status')),
                  Expanded(flex: 2, child: CustomHeadder(label: 'Courier')),
                  Expanded(
                      flex: 2,
                      child: CustomHeadder(label: 'Shipping Charge')),
                  Expanded(
                      flex: 2, child: CustomHeadder(label: 'Delivery Time')),
                  Expanded(flex: 3, child: CustomHeadder(label: 'Actions')),
                ],
              ),
            ),
            // Rows
            if (_filteredOrders.isEmpty)
              const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Text('No orders found',
                      style:
                          TextStyle(color: Color(0xff6B7280), fontSize: 14)),
                ),
              )
            else
              ..._filteredOrders.map((order) => _buildDesktopRow(order)),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopRow(OrderMod order) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Row(
        children: [
          // Order ID
          Expanded(
            flex: 2,
            child: Text(order.orderId,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff111827),
                    fontSize: 13)),
          ),
          // Customer
          Expanded(
            flex: 3,
            child: _buildCustomerCell(order),
          ),
          // Address
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: 14, color: Colors.grey.shade500),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(order.address,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xff6B7280), fontSize: 13)),
                ),
              ],
            ),
          ),
          // Status
          Expanded(flex: 2, child: _buildStatusBadge(order.status)),
          // Courier
          Expanded(
            flex: 2,
            child: Text(order.courier,
                style: const TextStyle(
                    color: Color(0xff374151), fontSize: 13)),
          ),
          // Shipping
          Expanded(
            flex: 2,
            child: Text('\$${order.shippingCharge.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff111827),
                    fontSize: 13)),
          ),
          // Delivery Time
          Expanded(
            flex: 2,
            child: Text(order.deliveryTime,
                style: const TextStyle(
                    color: Color(0xff6B7280), fontSize: 13)),
          ),
          // Actions
          Expanded(
            flex: 3,
            child: _buildActionButtons(context, order),
          ),
        ],
      ),
    );
  }

  // ─── MOBILE CARDS ────────────────────────────────────────────────────
  Widget _buildMobileCards() {
    if (_filteredOrders.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Text('No orders found',
              style: TextStyle(color: Color(0xff6B7280), fontSize: 14)),
        ),
      );
    }

    return Column(
      children:
          _filteredOrders.map((order) => _buildMobileCard(order)).toList(),
    );
  }

  Widget _buildMobileCard(OrderMod order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E7EB)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top row: Order ID + Status badge ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.orderId,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff111827),
                    fontSize: 14),
              ),
              _buildStatusBadge(order.status),
            ],
          ),

          const SizedBox(height: 12),

          // ── Customer info ──
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: order.avatarColor.withOpacity(0.15),
                child: Text(
                  order.avatarInitials,
                  style: TextStyle(
                    color: order.avatarColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.customerName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff111827),
                          fontSize: 13)),
                  Text(order.phone,
                      style: TextStyle(
                          fontSize: 11, color: Colors.grey.shade500)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade100, height: 1),
          const SizedBox(height: 12),

          // ── Details grid ──
          Row(
            children: [
              Expanded(
                child: _buildCardDetail(
                  icon: Icons.location_on_outlined,
                  label: 'Address',
                  value: order.address,
                ),
              ),
              Expanded(
                child: _buildCardDetail(
                  icon: Icons.local_shipping_outlined,
                  label: 'Courier',
                  value: order.courier,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildCardDetail(
                  icon: Icons.attach_money,
                  label: 'Shipping',
                  value: '\$${order.shippingCharge.toStringAsFixed(2)}',
                ),
              ),
              Expanded(
                child: _buildCardDetail(
                  icon: Icons.access_time,
                  label: 'Delivery',
                  value: order.deliveryTime,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade100, height: 1),
          const SizedBox(height: 12),

          // ── Action buttons ──
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xff374151),
                    side: BorderSide(color: Colors.grey.shade300),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.visibility_outlined, size: 15),
                  label: const Text('View Details', style: TextStyle(fontSize: 12)),

                ),
              ),
              const SizedBox(width: 8),
              _buildIconBtn(
                  icon: Icons.edit_outlined,
                  color: Colors.blue.shade400,
                  onTap: () {}),
              const SizedBox(width: 6),
              _buildIconBtn(
                  icon: Icons.delete_outline,
                  color: Colors.red.shade400,
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetail(
      {required IconData icon,
      required String label,
      required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade400),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
              Text(value,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff374151)),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconBtn(
      {required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 17, color: color),
      ),
    );
  }

  // ─── SHARED WIDGETS ──────────────────────────────────────────────────

  Widget _buildCustomerCell(OrderMod order) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: order.avatarColor.withOpacity(0.15),
          child: Text(order.avatarInitials,
              style: TextStyle(
                  color: order.avatarColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.customerName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff111827),
                      fontSize: 13)),
              Text(order.phone,
                  style: TextStyle(
                      fontSize: 11, color: Colors.grey.shade500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, OrderMod order) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: const Text('View Details',
              style: TextStyle(
                  color: Color(0xff374151),
                  fontWeight: FontWeight.w500,
                  fontSize: 13)),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            const CustomOrders().showUpdateStatusDialog(
              context: context,
              order: order,
              onUpdate: (status) {
                _updateOrderStatus(order.orderId, status);
              },
            );
          },
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(Icons.edit_outlined,
                size: 16, color: Colors.grey.shade600),
          ),
        ),
        const SizedBox(width: 4),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(Icons.delete_outline,
                size: 16, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleTab(
      {required String label, required int index, IconData? icon}) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon,
                  size: 13,
                  color: isSelected ? Colors.white : Colors.black87),
              const SizedBox(width: 5),
            ],
            Text(label,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item, style: const TextStyle(fontSize: 13)),
                  ))
              .toList(),
          onChanged: onChanged,
          icon: const Icon(Icons.keyboard_arrow_down, size: 18),
          style: const TextStyle(fontSize: 13, color: Color(0xff374151)),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    late Color bg, fg;
    late String label;
    late IconData icon;

    switch (status) {
      case OrderStatus.pending:
        bg = const Color(0xffFEF3C7);
        fg = const Color(0xffD97706);
        label = 'Pending';
        icon = Icons.access_time;
        break;
      case OrderStatus.confirmed:
        bg = const Color(0xffDBEAFE);
        fg = const Color(0xff2563EB);
        label = 'Confirmed';
        icon = Icons.local_shipping_outlined;
        break;
      case OrderStatus.delivered:
        bg = const Color(0xffD1FAE5);
        fg = const Color(0xff059669);
        label = 'Delivered';
        icon = Icons.check_circle_outline;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: fg),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  color: fg, fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // ─── CALENDAR VIEW ──────────────────────────────────────────────────
  Widget _buildCalendarContent(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _buildCalendarPane(),
          const SizedBox(height: 16),
          _buildCalendarSidebar(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 7, child: _buildCalendarPane()),
        const SizedBox(width: 24),
        Expanded(flex: 3, child: _buildCalendarSidebar()),
      ],
    );
  }

  Widget _buildCalendarPane() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      size: 20, color: Color(0xff374151)),
                  SizedBox(width: 8),
                  Text("Order Booking",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff111827))),
                ],
              ),
              Row(
                children: [
                  _buildNavIcon(Icons.chevron_left, () {
                    setState(() {
                      _focusedDay = DateTime(
                          _focusedDay.year, _focusedDay.month - 1, _focusedDay.day);
                    });
                  }),
                  const SizedBox(width: 16),
                  Text(_getMonthYear(_focusedDay),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff111827))),
                  const SizedBox(width: 16),
                  _buildNavIcon(Icons.chevron_right, () {
                    setState(() {
                      _focusedDay = DateTime(
                          _focusedDay.year, _focusedDay.month + 1, _focusedDay.day);
                    });
                  }),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          // Calendar Grid
          TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            headerVisible: false,
            daysOfWeekHeight: 40,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(color: Color(0xff6B7280), fontSize: 13),
              weekendStyle:
                  TextStyle(color: Color(0xff6B7280), fontSize: 13),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              cellMargin: const EdgeInsets.all(8),
              defaultTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xff374151)),
              weekendTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xff374151)),
              todayDecoration: const BoxDecoration(
                  color: Colors.transparent, shape: BoxShape.rectangle),
              todayTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xff374151)),
              selectedDecoration: BoxDecoration(
                color: const Color(0xffE2E8F0),
                 borderRadius: BorderRadius.circular(12),
              ),
              selectedTextStyle: const TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xff1e293b)),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return _buildCalendarCell(day);
              },
              selectedBuilder: (context, day, focusedDay) {
                return _buildCalendarCell(day, isSelected: true);
              },
              todayBuilder: (context, day, focusedDay) {
                return _buildCalendarCell(day, isToday: true);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCell(DateTime day,
      {bool isSelected = false, bool isToday = false}) {
    // Mocking some events dynamically per day
    int eventCount = 0;
    bool isActive = false;
    if (day.day == 1) {
      isActive = true;
      eventCount = 2;
    } else if (day.day == 3) {
      eventCount = 3;
    } else if (day.day == 5) {
      eventCount = 1;
    } else if (day.day == 7) {
      eventCount = 2;
    }

    final hasEvent = eventCount > 0;
    final isSpecialBlue = isActive && hasEvent;

    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isSpecialBlue
            ? const Color(0xff4F46E5)
            : hasEvent
                ? const Color(0xffE0E7FF)
                : isSelected
                    ? const Color(0xffF1F5F9)
                    : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '${day.day}',
              style: TextStyle(
                fontWeight: isSelected || hasEvent
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: isSpecialBlue
                    ? Colors.white
                    : hasEvent
                        ? const Color(0xff3730A3)
                        : const Color(0xff374151),
                fontSize: 14,
              ),
            ),
          ),
          if (hasEvent)
            Positioned(
              right: 6,
              bottom: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xff4F46E5),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$eventCount',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffE5E7EB)),
        ),
        child: Icon(icon, size: 16, color: const Color(0xff6B7280)),
      ),
    );
  }

  String _getMonthYear(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Widget _buildCalendarSidebar() {
    final dayStr = '${_getMonthYear(_selectedDay ?? DateTime.now()).split(' ')[0]} ${_selectedDay?.day ?? DateTime.now().day}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Orders for $dayStr',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827))),
        const SizedBox(height: 4),
        const Text('2 deliverys scheduled',
            style: TextStyle(fontSize: 13, color: Color(0xff6B7280))),
        const SizedBox(height: 16),
        // Mock Cards
        _buildSidebarOrderCard(
            orderId: 'ORD-001',
            time: '10:00 AM',
            name: 'Sarah Johnson',
            status: OrderStatus.pending,
            items: 'Office Chair x2, Desk',
            actionText: 'Mark as Confirmed'),
        _buildSidebarOrderCard(
            orderId: 'ORD-002',
            time: '10:00 AM',
            name: 'Sarah Johnson',
            status: OrderStatus.confirmed,
            items: 'Office Chair x2, Desk',
            actionText: 'Mark as Delivered'),
      ],
    );
  }

  Widget _buildSidebarOrderCard({
    required String orderId,
    required String time,
    required String name,
    required OrderStatus status,
    required String items,
    required String actionText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(orderId,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff111827),
                          fontSize: 14)),
                  Text(time,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xff6B7280))),
                ],
              ),
              _buildStatusBadge(status),
            ],
          ),
          const SizedBox(height: 16),
          Text(name,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xff111827),
                  fontSize: 13)),
          const SizedBox(height: 8),
          _buildSidebarItemRow(Icons.location_on_outlined,
              '123 Main St, City to\n123 Main St, City'),
          const SizedBox(height: 6),
          _buildSidebarItemRow(Icons.phone_outlined, '+1 234 567 8901'),
          const SizedBox(height: 6),
          _buildSidebarItemRow(Icons.inventory_2_outlined, items),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final order = _orders.firstWhere(
                    (o) => o.orderId.replaceAll('#', '') == orderId,
                    orElse: () => _orders.first);

                const CustomOrders().showUpdateStatusDialog(
                  context: context,
                  order: order,
                  onUpdate: (status) {
                    _updateOrderStatus(order.orderId, status);
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEF4444),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(actionText,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildDialogInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 13, color: Color(0xff374151))),
        Text(value,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xff111827))),
      ],
    );
  }

  Widget _buildDialogStatusRow(String label, OrderStatus status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 13, color: Color(0xff374151))),
        _buildStatusBadge(status),
      ],
    );
  }

  void _updateOrderStatus(String orderId, OrderStatus newStatus) {
    setState(() {
      final index = _orders.indexWhere((o) => o.orderId == orderId);
      if (index != -1) {
        _orders[index] = _orders[index].copyWith(status: newStatus);
      }
    });
  }

  Widget _buildSidebarItemRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: const Color(0xff9CA3AF)),
        const SizedBox(width: 8),
        Expanded(
            child: Text(text,
                style: const TextStyle(
                    fontSize: 12, color: Color(0xff6B7280)))),
      ],
    );
  }
}