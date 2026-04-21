import 'package:flutter/material.dart';
import 'package:roberto/features/Subscription/widget/custom_plan.dart';

class CustomPlans extends StatelessWidget {
  const CustomPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(height: 10),
        CustomPlan(
          title: "Full Moon",
          subtitle: "Main commercial plan",
          price: "\$199",
          iconPath: "assets/full.svg",
          features: [
            "5-10 users",
            "multi-channel",
            "advanced AI assistant",
            "CRM pipeline",
            "automation",
            "automation",
            "automation",
          ],
        ),

        SizedBox(height: 30),

        CustomPlan(
          title: "Full Moon",
          subtitle: "Main commercial plan",
          price: "\$199",
          iconPath: "assets/full.svg",
          features: [
            "5-10 users",
            "multi-channel",
            "advanced AI assistant",
            "CRM pipeline",
            "automation",
          ],
        ),

        SizedBox(height: 30),

        CustomPlan(
          title: "Full Moon",
          subtitle: "Main commercial plan",
          price: "\$199",
          iconPath: "assets/full.svg",
          features: [
            "5-10 users",
            "multi-channel",
            "advanced AI assistant",
            "CRM pipeline",
            "automation",
          ],
        ),

      ],
    );
  }
}