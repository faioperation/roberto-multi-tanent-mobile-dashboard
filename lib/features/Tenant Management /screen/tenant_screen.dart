import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_stat_card.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/Custom_Addtenant.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_builditem.dart';

class TenantScreen extends StatefulWidget {
  const TenantScreen({super.key});

  @override
  State<TenantScreen> createState() => _TenantScreenState();
}

class _TenantScreenState extends State<TenantScreen> {


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
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const CustomAddtenant(),
                );
              },
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
                iconPath: "assets/tenant.svg",
              ),
              CustomStatCard(
                label: 'Active Tenant',
                value: '38',
                iconPath: "assets/active.svg",
              ),
              CustomStatCard(
                label: 'MRR',
                value: '\$8.9K',
                iconPath: "assets/MRR.svg",
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
                  ],
                ),
              ),

              // Column headers
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                color: AppColor.secondary,
                child: const Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: CustomHeadder(label: 'Business Name')),
                    Expanded(
                        flex: 3,
                        child: CustomHeadder(label: 'Owner Name')),
                    Expanded(
                        flex: 4, child: CustomHeadder(label: 'Contact')),
                    Expanded(flex: 2, child: CustomHeadder(label: 'Plan')),
                    Expanded(flex: 2, child: CustomHeadder(label: 'Status')),
                    Expanded(
                        flex: 2,
                        child: CustomHeadder(label: 'Plan Price')),
                    Expanded(
                        flex: 1,
                        child: CustomHeadder(label: 'Actions')),
                  ],
                ),
              ),

              // Rows
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _tenants.length,
                separatorBuilder: (context, index) =>
                const Divider(
                    height: 1, color: Color(0xffF3F4F6)),
                itemBuilder: (context, index) {
                  final t = _tenants[index];
                  return _buildRow(t);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildRow(Map<String, String> tenant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              tenant['business']!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              tenant['owner']!,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff374151),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tenant['email']!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff374151),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  tenant['phone']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff6B7280),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              tenant['plan']!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff374151),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: tenant['status'] == 'Active' 
                    ? const Color(0xffD1FAE5) 
                    : AppColor.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                tenant['status']!,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: tenant['status'] == 'Active' 
                      ? const Color(0xff065F46) 
                      : const Color(0xff991B1B),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              tenant['price']!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff111827),
              ),
            ),
          ),


          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
              onPressed: () => _showClientDetailsDialog(tenant),
            ),
          ),
        ],
      ),
    );
  }

  void _showClientDetailsDialog(Map<String, String> tenant) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Client Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),

              const SizedBox(height: 4),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'View and manage client account information',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff6B7280),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: CustomBuilditem(label: 'Business Name',  value: tenant['business']!),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomBuilditem(label: 'Owner',  value: tenant['owner']!),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: CustomBuilditem(label: 'Email',  value: tenant['email']!),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomBuilditem(label: 'Phone',  value: tenant['phone']!),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: CustomBuilditem(label: 'Plan',  value: tenant['plan']!),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomBuilditem(label: 'Status',value: tenant['status']!),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: CustomBuilditem(label: 'Monthly Revenue',  value: tenant['price']!),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomBuilditem(label: 'Joined Date',value:  'Jan 15, 2024'),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          if (label == 'Plan' || label == 'Status')
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: label == 'Status' && value == 'Active'
                    ? const Color(0xffD1FAE5)
                    : label == 'Status' && value == 'Suspended'
                        ? AppColor.secondary
                        : const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: label == 'Status' && value == 'Active'
                      ? const Color(0xff065F46)
                      : label == 'Status' && value == 'Suspended'
                          ? const Color(0xff991B1B)
                          : const Color(0xff374151),
                ),
              ),
            )
          else
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlanBadge(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColor.green,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColor.lessgreen,
              width: 1,
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.deepgreen,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: value == 'Active'
                ? const Color(0xffD1FAE5)
                : AppColor.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: value == 'Active'
                  ? const Color(0xff065F46)
                  : const Color(0xff991B1B),
            ),
          ),
        ),
      ],
    );
  }
}
