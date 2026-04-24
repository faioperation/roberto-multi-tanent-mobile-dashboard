import 'package:flutter/material.dart';
import 'package:roberto/features/Subscription/widget/custom_plan.dart';
import 'package:roberto/features/Subscription/widget/custom_Billing.dart';

class CustomPlanbilling extends StatefulWidget {
  const CustomPlanbilling({super.key});

  @override
  State<CustomPlanbilling> createState() => _CustomPlanbillingState();
}

class _CustomPlanbillingState extends State<CustomPlanbilling> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildToggleBar(),
        const SizedBox(height: 45),
        _selectedIndex == 0 ? _buildPlansContent() : _buildBillingContent(),
      ],
    );
  }

  Widget _buildToggleBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade100 : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tabButton('Plans', 0),
          _tabButton('Billing History', 1),
        ],
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
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

  Widget _buildPlansContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 900;
        bool isTablet = constraints.maxWidth > 600;

        final plans = [
          CustomPlan(
            title: "Half Moon",
            subtitle: "For small businesses / entry plan",
            price: "\$49",
            iconPath: "assets/half.svg",
            features: [
              "2 channels",
              "up to 1,000 chats/month",
              "shared inbox",
              "basic AI instant replies",
              "basic lead capture",
              "basic booking form",
              "limited analytics",
              "no advanced automation",
              "no campaigns",
              "no voice AI",
            ],
          ),
          CustomPlan(
            title: "Full Moon",
            subtitle: "Main commercial plan",
            price: "\$199",
            iconPath: "assets/full.svg",
            features: [
              "everything in Half Moon, plus:",
              "multi-channel",
              "up to 5,000 chats/month",   
              "advanced AI assistant",
              "CRM pipeline",
              "full booking workflow",
              "pricing engine",
              "quote generation",
              "workflow automation",
              "chat summaries",
              "WhatsApp campaigns (basic)",
              "analytics dashboard",
              "AI assist for agents",
            ],
          ),
          CustomPlan(
            title: "Moon Enterprise",
            subtitle: "Advanced / high-volume plan",
            price: "\$499",
            iconPath: "assets/enter.svg",
            features: [
              "everything in Full Moon, plus:",
              "unlimited or high-volume chats",
              "multi-branch / multi-country",
              "advanced workflow automation",
              "advanced campaigns",
              "API integrations",
              "advanced analytics",
              "dedicated onboarding",
              "priority support",
              "voice AI included or as premium add-on",
            ],
          ),
        ];

        // 💻 Desktop
        if (isDesktop) {
          return Row(
            children: plans
                .map((p) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: p,
              ),
            ))
                .toList(),
          );
        }

        // 📱 Tablet
        else if (isTablet) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: plans[0]),
                  const SizedBox(width: 16),
                  Expanded(child: plans[1]),
                ],
              ),
              const SizedBox(height: 16),
              plans[2],
            ],
          );
        }

        // 📱 Mobile
        else {
          return Column(
            children: plans
                .map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: p,
            ))
                .toList(),
          );
        }
      },
    );
  }

  Widget _buildBillingContent() {
    return const CustomBilling();
  }
}