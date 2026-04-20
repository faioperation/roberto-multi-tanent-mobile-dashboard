import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/features/Pricing/widget/custom_addrule.dart';
import 'package:roberto/features/Pricing/widget/custom_pricingrule.dart';
import 'package:roberto/features/Pricing/widget/custom_pricingcalculator.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_stat_card.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  int _selectedTab = 0;

  Widget _buildStatCards(double width) {
    final cards = [
      CustomStatCard(
        label: 'Base Rate',
        value: '\$15/kg',
        iconPath: 'assets/rate.svg',
      ),
      CustomStatCard(
        label: 'Active Rules',
        value: '3',
        iconPath: 'assets/rule.svg',
      ),
      CustomStatCard(
        label: 'Categories',
        value: '5',
        iconPath: 'assets/categori.svg',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width < 640 ? 1 : (width < 1000 ? 2 : 3),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 115,
      ),
      itemBuilder: (context, index) {
        return cards[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Pricing Management',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const CustomAddrule (),
                    );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Add Rule",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          const Text(
            'Manage pricing rules and product categories',
            style: TextStyle(fontSize: 15, color: AppColor.grey),
          ),

          const SizedBox(height: 20),

          _buildStatCards(width),

          const SizedBox(height: 25),

          _buildToggleTabs(),

          const SizedBox(height: 25),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: _selectedTab == 0
                ? const CustomPricingrule(key: ValueKey('Pricing Rules'))
                : const CustomPricingcalculator(
                key: ValueKey('Price Calculator')),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTab(index: 0, label: 'Pricing Rules'),
          _buildTab(index: 1, label: 'Price Calculator'),
        ],
      ),
    );
  }

  Widget _buildTab({
    required int index,
    required String label,
  }) {
    final isActive = _selectedTab == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                isActive ? FontWeight.w500 : FontWeight.w400,
                color:
                isActive ? const Color(0xff111827) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}