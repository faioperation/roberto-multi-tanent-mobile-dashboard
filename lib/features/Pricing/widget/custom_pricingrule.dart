import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Pricing/widget/custom_widgetrule.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

class CustomPricingrule extends StatelessWidget {
  const CustomPricingrule({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
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
          const Text(
            "Configure automatic pricing based on weight, product type, or custom conditions",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 26),

          if (isDesktop)
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffE5E7EB)),
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
                      color: AppColor.secondary,
                      child: Row(
                        children: const [
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
          CustomWidgetrule(
            title: "Per KG Pricing",
            badgeText: "weight",
            description: "15 \$/kg",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),


          CustomWidgetrule(
            title: "TV price",
            badgeText: "product type",
            description: "Electronics: +20%",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),


          CustomWidgetrule(
            title: "Fixed item price",
            badgeText: "custom",
            description: "Order > \$500 → -10%",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),


          CustomWidgetrule(
            title: "Carton/drum/bicycle price",
            badgeText: "product type",
            description: "Electronics: +20%",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),


          CustomWidgetrule(
            title: "CBM conversion",
            badgeText: "product type",
            description: "Electronics: +20%",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),


          CustomWidgetrule(
            title: "Customs fee",
            badgeText: "product type",
            description: "Electronics: +20%",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),


          CustomWidgetrule(
            title: "Promotion & discount",
            badgeText: "product type",
            description: "Electronics: +20%",
            onEdit: () {
              print("Edit clicked");
            },
            onDelete: () {
              print("Delete clicked");
            },
          ),
        ],
      ),
    );
  }
}