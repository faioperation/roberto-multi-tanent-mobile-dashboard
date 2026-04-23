import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class SubscriptionRow extends StatelessWidget {
  final String date;
  final String plan;
  final String price;
  final String expireDate;
  final String status;
  final bool isMobile;

  const SubscriptionRow({
    super.key,
    required this.date,
    required this.plan,
    required this.price,
    required this.expireDate,
    required this.status,
    this.isMobile = false,
  });

  bool get isPaid => status.toLowerCase() == 'paid';
  bool get isUnpaid => status.toLowerCase() == 'unpaid';

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return _buildMobileCard();
    }

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
              child: _buildStatusPill(),
            ),
          ),

          // Renew Button (ONLY for unpaid)
          Expanded(
            flex: 2,
            child: isUnpaid
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: _buildRenewButton(),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plan,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              _buildStatusPill(),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn("Date", date),
              _buildInfoColumn("Expire Date", expireDate),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildInfoColumn("Pricing", price),
              if (isUnpaid) _buildRenewButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColor.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.black),
        ),
      ],
    );
  }

  Widget _buildStatusPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isPaid ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isPaid ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isPaid ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
        ),
      ),
    );
  }

  Widget _buildRenewButton() {
    return InkWell(
      onTap: () {
        print("Renew Now clicked");
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
    );
  }
}