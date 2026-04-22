import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class ChatView extends StatelessWidget {
  final VoidCallback? onBack;

  const ChatView({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffEEEEEE))),
            ),
            child: Row(
              children: [
                if (onBack != null)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xff111827)),
                    onPressed: onBack,
                  ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "SJ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sarah Johnson",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff111827),
                      ),
                    ),
                    Text(
                      "Active now",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Ai-agent",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff374151),
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: true,
                  onChanged: (val) {},
                  activeColor: const Color(0xff4F46E5),
                ),
              ],
            ),
          ),
          
          // Messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildMessageBubble(
                  text: "Hi, I'd like to know more about your products..",
                  time: "10:30 AM",
                  isMe: false,
                ),
                const SizedBox(height: 16),
                _buildMessageBubble(
                  text: "Hello! I'd be happy to help. What products are\nyou interested in?",
                  time: "10:32 AM",
                  isMe: true,
                ),
                const SizedBox(height: 16),
                _buildMessageBubble(
                  text: "I'm looking for office furniture, specifically desks\nand chairs.",
                  time: "10:33 AM",
                  isMe: false,
                ),
                const SizedBox(height: 16),
                _buildMessageBubble(
                  text: "Great! We have a wide selection of office furniture.\nLet me share our catalog with you.",
                  time: "10:35 AM",
                  isMe: true,
                ),
              ],
            ),
          ),
          
          // Input area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xffF3F4F6),
              border: Border(top: BorderSide(color: Color(0xffE5E7EB))),
            ),
            child: Row(
              children: [
                const Icon(Icons.sentiment_satisfied_alt, color: Color(0xff9CA3AF)),
                const SizedBox(width: 12),
                const Icon(Icons.attach_file, color: Color(0xff9CA3AF)),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xff9CA3AF)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.mic_none, color: Color(0xff9CA3AF)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({required String text, required String time, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xffE22A28) : const Color(0xffF3F4F6),
              borderRadius: BorderRadius.circular(16).copyWith(
                bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(16),
                topLeft: isMe ? const Radius.circular(16) : const Radius.circular(0),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : const Color(0xff374151),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xff9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
