import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/businesssubscription/widget/custom_plans.dart';
import 'package:roberto/features/businesssubscription/widget/custom_history.dart';

class BusinessSubscription extends StatefulWidget {
  const BusinessSubscription({super.key});

  @override
  State<BusinessSubscription> createState() => _BusinessSubscriptionState();
}

class _BusinessSubscriptionState extends State<BusinessSubscription> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscription Management',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Configure and train your AI assistant',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        _buildToggleTabs(),

        const SizedBox(height: 25),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: _selectedTab == 0
              ? const CustomPlans(
            key: ValueKey('Plans'),
          )
              : const CustomHistory(
            key: ValueKey('Billing History'),
          ),
        ),
      ],
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
          _buildTab(index: 0, label: 'Plans'),
          _buildTab(index: 1, label: 'Billing History'),
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
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
            color: isActive ? const Color(0xff111827) : Colors.grey,
          ),
        ),
      ),
    );
  }
}