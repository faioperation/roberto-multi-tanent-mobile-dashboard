import 'package:flutter/material.dart';
import 'package:roberto/common/dashboard_layout.dart';
import 'package:roberto/features/Inbox/widget/chat_list.dart';
import 'package:roberto/features/Inbox/widget/chat_view.dart';
import 'package:roberto/features/Inbox/widget/chat_details.dart';

class InboxScreen extends StatefulWidget {
  final bool isSystemOwner;
  const InboxScreen({super.key, this.isSystemOwner = false});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return DashboardLayout(
      activeItem: 'Inbox',
      isSystemOwner: widget.isSystemOwner,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Inbox",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Manage all your customer conversations in one place",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: MediaQuery.of(context).size.height - 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffE5E7EB)),
            ),
            child: isDesktop
                ? const Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ChatList(),
                      ),
                      VerticalDivider(width: 1, thickness: 1, color: Color(0xffE5E7EB)),
                      Expanded(
                        flex: 4,
                        child: ChatView(),
                      ),
                      VerticalDivider(width: 1, thickness: 1, color: Color(0xffE5E7EB)),
                      Expanded(
                        flex: 3,
                        child: ChatDetails(),
                      ),
                    ],
                  )
                : const Column(
                    children: [
                      Expanded(child: ChatList()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
