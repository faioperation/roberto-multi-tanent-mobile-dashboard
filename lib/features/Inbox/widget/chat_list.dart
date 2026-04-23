import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class ChatList extends StatefulWidget {
  final void Function(int index)? onChatSelected;

  const ChatList({super.key, this.onChatSelected});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  int _activeChatIndex = 0;
  int _activeFilterIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Filter section
          _buildFilterItem(-1, null, "All", "45"),
          
          // Social Filters
          _buildFilterItem(0, Icons.facebook, "Facebook", "15"),
          _buildFilterItem(1, Icons.camera_alt_outlined, "Instagram", "20"),
          _buildFilterItem(2, Icons.message_outlined, "WhatsApp", "10"),
          
          const Divider(height: 16),
          
          // Chat list
          Expanded(
            child: ListView(
              children: [
                _buildChatListItem(0, "R", "Roberto", "2m ago", "Hi, I'd like to know more about..."),
                _buildChatListItem(1, "MC", "Michael Cher", "15m ago", "Thank you for the quick response!"),
                _buildChatListItem(2, "EW", "Emma Wilso", "1h ago", "Can I schedule a booking for"),
                _buildChatListItem(3, "DB", "David Brow", "2h ago", "What are your business hours?"),
                _buildChatListItem(4, "LA", "Lisa Andersor", "3h ago", "I received my order, it's perfect!"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterItem(int index, IconData? icon, String title, String count) {
    bool isActive = _activeFilterIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _activeFilterIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Container(
          decoration: isActive
              ? BoxDecoration(
                  color: AppColor.primary, // AppColor.primary
                  borderRadius: BorderRadius.circular(24),
                )
              : null,
          padding: EdgeInsets.symmetric(
              horizontal: isActive ? 16 : 0, vertical: isActive ? 8 : 8),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 20,
                  color: isActive ? Colors.white : const Color(0xff6B7280),
                ),
                const SizedBox(width: 12),
              ],
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isActive ? Colors.white : const Color(0xff374151),
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (isActive)
                Text(
                  count,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
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
        ),
      ),
    );
  }

  Widget _buildChatListItem(int index, String initials, String name, String time, String preview) {
    bool isActive = _activeChatIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _activeChatIndex = index;
        });
        if (widget.onChatSelected != null) {
          widget.onChatSelected!(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: isActive ? const Color(0xffFEE2E2) : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColor.primary,
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
      ),
    );
  }
}
