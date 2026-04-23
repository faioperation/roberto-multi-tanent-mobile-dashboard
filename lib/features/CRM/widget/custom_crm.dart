import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/common/custom_search.dart';
import 'package:roberto/features/CRM/widget/custom_lead_row.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

class CustomCrm extends StatelessWidget {
  const CustomCrm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerTheme.color ?? const Color(0xffEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDesktop 
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side (Texts)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lead Pipeline",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Manage your leads efficiently",
                          style: TextStyle(
                            fontSize: 15,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right Side (Search + Status)
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Search
                        CustomSearch(),

                        const SizedBox(width: 10),

                        // Status Button
                        _buildStatusButton(context),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lead Pipeline",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: CustomSearch()),
                      const SizedBox(width: 10),
                      _buildStatusButton(context),
                    ],
                  ),
                ],
              ),
          const SizedBox(height: 26),

          Container(
            decoration: BoxDecoration(
              color: theme.cardTheme.color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.dividerTheme.color ?? const Color(0xffEEEEEE)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  if (isDesktop)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      color: Theme.of(context).brightness == Brightness.dark ? theme.colorScheme.surface : theme.colorScheme.secondary,
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Name'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Contact'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Source'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Status'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Last Contact'),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomHeadder(label: 'Actions'),
                          ),
                        ],
                      ),
                    ),
                  CustomLeadRow(
                    name: "Sarah Johnson",
                    email: "sarah.j@email.com",
                    phone: "++1 234 567 8901",
                    socialText: "Facebook",
                    socialIcon: Icons.facebook,
                    tagText: "Cold",
                    tagColor: AppColor.deepgreen,
                    time: "2 hours ago",
                    notes: "Interested in premium products and services.",
                  ),
                  CustomLeadRow(
                    name: "Michael Chen",
                    email: "m.chen@email.com",
                    phone: "++1 234 567 8901",
                    socialText: "WhatsApp",
                    socialIcon: Icons.facebook,
                    tagText: "Warm",
                    tagColor: AppColor.greens,
                    time: "1 day ago",
                    notes: "Follow up next week for demo.",
                  ),
                  CustomLeadRow(
                    name: "Emma Wilson",
                    email: "emma.w@email.com",
                    phone: "+1 234 567 8903",
                    socialText: "Instagram",
                    socialIcon: Icons.facebook,
                    tagText: "Booked",
                    tagColor: AppColor.ma,
                    time: "3 hours ago",
                    notes: "Meeting scheduled for Friday.",
                  ),
                  CustomLeadRow(
                    name: "David Brown",
                    email: "d.brown@email.com",
                    phone: "+1 234 567 8904",
                    socialText: "Facebook",
                    socialIcon: Icons.facebook,
                    tagText: "Hot",
                    tagColor: AppColor.primary,
                    time: "5 days ago",
                    notes: "Ready for contract signing.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        print("Status clicked");
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.dividerTheme.color ?? Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              Icons.filter_list,
              size: 18,
              color: theme.textTheme.bodySmall?.color,
            ),
            const SizedBox(width: 6),
            Text(
              "All Status",
              style: TextStyle(fontSize: 13, color: theme.colorScheme.onSurface),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: theme.colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}