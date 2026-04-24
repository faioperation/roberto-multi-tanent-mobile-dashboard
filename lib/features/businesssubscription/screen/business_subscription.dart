import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/businesssubscription/widget/custom_plans.dart';
import 'package:roberto/features/businesssubscription/widget/custom_history.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_stat_card.dart';

class BusinessSubscription extends StatefulWidget {
  const BusinessSubscription({super.key});

  @override
  State<BusinessSubscription> createState() => _BusinessSubscriptionState();
}

class _BusinessSubscriptionState extends State<BusinessSubscription> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscription Management',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 600 ? 24 : 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Manage plans, billing, and subscriptions',
                    style: TextStyle(fontSize: 15, color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                ],
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
                label: 'MRR',
                value: '\$8.9K',
                iconPath: "assets/MRR.svg",
              ),
              CustomStatCard(
                label: 'ARR',
                value: '\$107K',
                iconPath: "assets/ARR.svg",
              ),
              CustomStatCard(
                label: 'Active Subs',
                value: '47',
                iconPath: "assets/person.svg",
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
        color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade100 : Theme.of(context).colorScheme.surface,
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
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).cardTheme.color : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(Theme.of(context).brightness == Brightness.light ? 0.08 : 0.2),
              blurRadius: 4,
              offset: const Offset(0, 1),
            )
          ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Theme.of(context).colorScheme.onSurface : Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}