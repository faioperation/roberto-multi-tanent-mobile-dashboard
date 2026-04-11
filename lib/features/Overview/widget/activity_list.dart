import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.trending_up, color: Colors.grey, size: 20),
              SizedBox(width: 8),
              Text(
                "Recent Activity",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildActivityItem(
            "New order #1234 from Sarah Johnson",
            "5 minutes ago",
            true,
          ),
          _buildActivityItem(
            "Booking confirmed for Michael Chen",
            "12 minutes ago",
            false,
          ),
          _buildActivityItem(
            "New message from Instagram - Emma Wilson",
            "23 minutes ago",
            false,
          ),
          _buildActivityItem(
            "Payment received - \$450.00",
            "1 hour ago",
            false,
          ),
          _buildActivityItem(
            "Support ticket #567 opened",
            "2 hours ago",
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String activity, String time, bool isNew) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xff4F46E5),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff374151),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
