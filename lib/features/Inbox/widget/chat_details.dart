import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Header info
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mrs Sarah",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff111827),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "+992371836",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff4B5563),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffFEE2E2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    "cold",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // Chat summary card
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE5E7EB)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                        ),
                        child: const Text(
                          "Chat summary",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Customer booked a uganda pickup in Kampala for 30 kg of clothes to be collected Sunday 2026-04-08 around 9:20; location pin and item list were provided, rate explained (16 QAR/kg with a 30 kg minimum) driver will call before arrival.",
                          style: TextStyle(
                            color: Color(0xff374151),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Recent Chat Details form
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE5E7EB)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: const BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                        ),
                        child: const Text(
                          "Recent Chat Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildFormField("Items", "Clothes"),
                            const SizedBox(height: 16),
                            _buildFormField("Pickup Area", "Banasreee, Dhaka, Bangladesh"),
                            const SizedBox(height: 16),
                            _buildFormField("Destination", "Uganda, Kampala"),
                            const SizedBox(height: 16),
                            _buildFormField("Weight", "16 kg"),
                            const SizedBox(height: 16),
                            _buildFormField("Pickup Date & Time", "Sunday, April 5, 2026 at 9:00 AM"),
                            const SizedBox(height: 16),
                            _buildFormField("Current status", "pending"),
                            const SizedBox(height: 16),
                            _buildFormField("Recent summary", "summary...."),
                            const SizedBox(height: 16),
                            _buildFormField("Booking info", "informa......"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xff374151),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD1D5DB)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff6B7280),
            ),
          ),
        ),
      ],
    );
  }
}
