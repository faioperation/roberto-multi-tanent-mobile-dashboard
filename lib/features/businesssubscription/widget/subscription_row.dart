import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class SubscriptionRow extends StatelessWidget {
  final String date;
  final String plan;
  final String price;
  final String expireDate;
  final String status;

  const SubscriptionRow({
    super.key,
    required this.date,
    required this.plan,
    required this.price,
    required this.expireDate,
    required this.status,
  });

  bool get isPaid => status.toLowerCase() == 'paid';
  bool get isUnpaid => status.toLowerCase() == 'unpaid';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          // Date
          Expanded(
            flex: 2,
            child: Text(date),
          ),

          // Plan
          Expanded(
            flex: 2,
            child: Text(plan),
          ),

          // Pricing
          Expanded(
            flex: 2,
            child: Text(price),
          ),

          // Expire Date
          Expanded(
            flex: 2,
            child: Text(expireDate),
          ),

          // Status
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: isPaid
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isPaid
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFC62828),
                  ),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isPaid
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFC62828),
                  ),
                ),
              ),
            ),
          ),

          // Renew Button (ONLY for unpaid)
          Expanded(
            flex: 2,
            child: isUnpaid
                ? Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  print("Renew Now clicked");
                },
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColor.grey,
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    "Renew Now",
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}