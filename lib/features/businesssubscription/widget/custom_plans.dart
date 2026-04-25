import 'package:flutter/material.dart';
import 'package:roberto/features/Subscription/widget/custom_plan.dart';

class CustomPlans extends StatelessWidget {
  const CustomPlans({super.key});

  @override
  Widget build(BuildContext context) {
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
}