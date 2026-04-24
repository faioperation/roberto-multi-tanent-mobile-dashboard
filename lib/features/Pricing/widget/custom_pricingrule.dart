import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Pricing/widget/custom_widgetrule.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

import 'package:roberto/features/Pricing/widget/pricing_rule_mod.dart';
import 'package:roberto/features/Pricing/widget/custom_addrule.dart';

class CustomPricingrule extends StatefulWidget {
  final List<PricingRuleMod> rules;
  final Function(PricingRuleMod) onEdit;
  final Function(String) onDelete;

  const CustomPricingrule({
    super.key,
    required this.rules,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<CustomPricingrule> createState() => _CustomPricingruleState();
}

class _CustomPricingruleState extends State<CustomPricingrule> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: Theme.of(context).dividerTheme.color ??
                const Color(0xffEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pricing Rules",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Configure automatic pricing based on weight, product type, or custom conditions",
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(height: 26),
          if (isDesktop)
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context).dividerTheme.color ??
                        const Color(0xffEEEEEE)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.surface
                          : AppColor.secondary,
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Rule Name'),
                          ),
                          Expanded(
                            flex: 3,
                            child: CustomHeadder(label: 'Type'),
                          ),
                          Expanded(
                            flex: 3,
                            child: CustomHeadder(label: 'Configuration'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Status'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Actions'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ...widget.rules.map((rule) => CustomWidgetrule(
                key: ValueKey(rule.id),
                title: rule.name,
                badgeText: rule.type,
                description: rule.value,
                onEdit: () => widget.onEdit(rule),
                onDelete: () => widget.onDelete(rule.id),
              )),
        ],
      ),
    );
  }
}