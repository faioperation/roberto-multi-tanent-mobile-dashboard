import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Filter section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffE22A28),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "45",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Social Filters
          _buildFilterItem(Icons.facebook, "Facebook", "15"),
          _buildFilterItem(Icons.camera_alt_outlined, "Instagram", "20"),
          _buildFilterItem(Icons.message_outlined, "WhatsApp", "10"),
          
          const Divider(height: 32),
          
          // Chat list
          Expanded(
            child: ListView(
              children: [
                _buildChatListItem("SJ", "Sarah Johnson", "2m ago", "Hi, I'd like to know more about...", true),
                _buildChatListItem("MC", "Michael Cher", "15m ago", "Thank you for the quick response!", false),
                _buildChatListItem("EW", "Emma Wilso", "1h ago", "Can I schedule a booking for", false),
                _buildChatListItem("DB", "David Brow", "2h ago", "What are your business hours?", false),
                _buildChatListItem("LA", "Lisa Andersor", "3h ago", "I received my order, it's perfect!", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterItem(IconData icon, String title, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xff6B7280)),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff374151),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff4B5563),
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatListItem(String initials, String name, String time, String preview, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: isActive ? const Color(0xffFEE2E2) : Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xffE22A28),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff111827),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  preview,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff6B7280),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
