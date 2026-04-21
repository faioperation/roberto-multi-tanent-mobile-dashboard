import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/features/businesssubscription/widget/subscription_row.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

class CustomHistory extends StatefulWidget {
  const CustomHistory({super.key});

  @override
  State<CustomHistory> createState() => _CustomHistoryState();
}

class _CustomHistoryState extends State<CustomHistory> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = true;

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
              // TOP HEADER ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Billing History",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "View all past transactions and invoices",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),

                  // EXPORT BUTTON
                  InkWell(
                    onTap: () {
                      print("Export clicked");
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColor.grey,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.download, size: 18, color: AppColor.black),
                          SizedBox(width: 6),
                          Text(
                            "Export",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 26),

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
                if (isDesktop)
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
                child: CustomHeadder(label: 'Billing Date'),
              ),
              Expanded(
                flex: 2,
                child: CustomHeadder(label: 'Plan'),
              ),
              Expanded(
                flex: 2,
                child: CustomHeadder(label: 'Subscription Pricing'),
              ),
              Expanded(
                flex: 2,
                child: CustomHeadder(label: 'Expire Date'),
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
                  SubscriptionRow(
                    date: "Apr 1, 2026",
                    plan: "Half Moon",
                    price: "\$49/Monthly",
                    expireDate: "May 1, 2026",
                    status: "Paid",
                  ),

                  SubscriptionRow(
                    date: "Mar 1, 2026",
                    plan: "Half Moon",
                    price: "\$49/Monthly",
                    expireDate: "Apr 1, 2026",
                    status: "Unpaid",
                  ),

                  SubscriptionRow(
                    date: "Feb 1, 2026",
                    plan: "Half Moon",
                    price: "\$49/Monthly",
                    expireDate: "Mar 1, 2026",
                    status: "Paid",
                  ),
                  SubscriptionRow(
                    date: "Jan 1, 2026",
                    plan: "Half Moon",
                    price: "\$49/Monthly",
                    expireDate: "Feb 1, 2026",
                    status: "Unpaid",
                  ),
                ]
            )
          )
        )
          ]
        )
    );
  }
}
