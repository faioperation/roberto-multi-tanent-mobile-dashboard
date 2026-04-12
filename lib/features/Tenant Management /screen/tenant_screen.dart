import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/common/custom_stat_card.dart';

class TenantScreen extends StatefulWidget {
  const TenantScreen({super.key});

  @override
  State<TenantScreen> createState() => _TenantScreenState();
}

class _TenantScreenState extends State<TenantScreen> {

  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'All Status';

  final List<Map<String, String>> _tenants = [
    {
      'business': 'Fashion Boutique',
      'owner': 'Sarah Johnson',
      'email': 'sarah@fashionboutique.com',
      'phone': '+1 234 567 8901',
      'plan': 'Half Moon',
      'status': 'Active',
      'price': '\$199',
    },
    {
      'business': 'TechGear Store',
      'owner': 'Michael Chen',
      'email': 'michael@techgear.com',
      'phone': '+1 234 567 8902',
      'plan': 'Full Moon',
      'status': 'Active',
      'price': '\$499',
    },
    {
      'business': 'Organic Foods Co',
      'owner': 'Emma Wilson',
      'email': 'emma@organicfoods.com',
      'phone': '+1 234 567 8903',
      'plan': 'Moon Enterprise',
      'status': 'Active',
      'price': '\$0',
    },
    {
      'business': 'Home Decor Hub',
      'owner': 'David Brown',
      'email': 'david@homedecor.com',
      'phone': '+1 234 567 8904',
      'plan': 'Half Moon',
      'status': 'Suspended',
      'price': '\$199',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get _filteredTenants {
    return _tenants.where((t) {
      final matchesSearch = t['business']!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()) ||
          t['owner']!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
      final matchesStatus = _selectedStatus == 'All Status' ||
          t['status'] == _selectedStatus;
      return matchesSearch && matchesStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tenant Management',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Manage businesses and their subscriptions',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white, size: 18),
              label: const Text(
                'Add Tenant',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),

        const SizedBox(height: 28),

        // ── Stat Cards ──────────────────────────────────────────────────────
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            final cards = [
              CustomStatCard(
                label: 'Total Tenant',
                value: '47',
                icon: Icons.grid_view_rounded,
                iconColor: const Color(0xff6366F1),
                iconBg: const Color(0xffEEF2FF),
              ),
              CustomStatCard(
                label: 'Active Tenant',
                value: '38',
                icon: Icons.group_outlined,
                iconColor: const Color(0xff10B981),
                iconBg: const Color(0xffD1FAE5),
              ),
              CustomStatCard(
                label: 'MRR',
                value: '\$8.9K',
                icon: Icons.attach_money,
                iconColor: const Color(0xff8B5CF6),
                iconBg: const Color(0xffEDE9FE),
              ),
            ];
            return isWide
                ? Row(
              children: cards
                  .map((c) =>
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: cards.indexOf(c) < 2 ? 16 : 0),
                      child: c,
                    ),
                  ))
                  .toList(),
            )
                : Column(
              children: cards
                  .map((c) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: c,
                  ))
                  .toList(),
            );
          },
        ),

        const SizedBox(height: 28),

        // ── Tenant List Table ────────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffE5E7EB)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Table header row
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tenant List',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff111827),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'View and manage all business tenant',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff6B7280)),
                          ),
                        ],
                      ),
                    ),
                    // Search
                    Container(
                      width: 200,
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffD1D5DB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (_) => setState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'Search clients...',
                          hintStyle:
                          TextStyle(color: Color(0xff9CA3AF), fontSize: 13),
                          prefixIcon: Icon(Icons.search,
                              color: Color(0xff9CA3AF), size: 18),
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Status Filter
                    PopupMenuButton<String>(
                      initialValue: _selectedStatus,
                      onSelected: (val) =>
                          setState(() => _selectedStatus = val),
                      itemBuilder: (_) =>
                          [
                            'All Status',
                            'Active',
                            'Suspended',
                          ]
                              .map((s) =>
                              PopupMenuItem(value: s, child: Text(s)))
                              .toList(),
                      child: Container(
                        height: 38,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.filter_list,
                                size: 16, color: Color(0xff6B7280)),
                            const SizedBox(width: 6),
                            Text(
                              _selectedStatus,
                              style: const TextStyle(
                                  fontSize: 13, color: Color(0xff374151)),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.keyboard_arrow_down,
                                size: 16, color: Color(0xff6B7280)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Column headers
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                color: const Color(0xffF9FAFB),
                child: const Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: _HeaderCell(label: 'Business Name')),
                    Expanded(
                        flex: 3,
                        child: _HeaderCell(label: 'Owner Name')),
                    Expanded(
                        flex: 4, child: _HeaderCell(label: 'Contact')),
                    Expanded(flex: 2, child: _HeaderCell(label: 'Plan')),
                    Expanded(flex: 2, child: _HeaderCell(label: 'Status')),
                    Expanded(
                        flex: 2,
                        child: _HeaderCell(label: 'Plan Price')),
                    Expanded(
                        flex: 1,
                        child: _HeaderCell(label: 'Actions')),
                  ],
                ),
              ),

              // Rows
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredTenants.length,
                separatorBuilder: (_, __) =>
                const Divider(
                    height: 1, color: Color(0xffF3F4F6)),
                itemBuilder: (context, index) {
                  final t = _filteredTenants[index];
                  return _buildRow(t);
                },
              ),

              if (_filteredTenants.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(
                    child: Text('No tenants found.',
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}


class _HeaderCell extends StatelessWidget {
  final String label;
  const _HeaderCell({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xff6B7280),
      ),
    );
  }
}
