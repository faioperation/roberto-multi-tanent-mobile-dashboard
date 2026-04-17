import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/features/AiAgent/widget/custom_agent.dart';
import 'package:roberto/features/AiAgent/widget/system_prompt_view.dart';
import 'package:roberto/features/AiAgent/widget/training_data_view.dart';

class AiagentScreen extends StatefulWidget {
  const AiagentScreen({super.key});

  @override
  State<AiagentScreen> createState() => _AiagentScreenState();
}

class _AiagentScreenState extends State<AiagentScreen> {
  int _selectedTab = 0; // 0 = System Prompt, 1 = Training Data

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        const Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Agent Management',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Configure and train your AI assistant',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // AI Agent Status Card
        const CustomAgent(),
        const SizedBox(height: 24),

        // Toggle Tab Bar
        _buildToggleTabs(),
        const SizedBox(height: 24),

        // Tab Content
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: _selectedTab == 0
              ? const SystemPromptView(key: ValueKey('system'))
              : const TrainingDataView(key: ValueKey('training')),
        ),
      ],
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTab(
            index: 0,
            iconPath: 'assets/system.svg',
            label: 'System Prompt',
          ),
          _buildTab(
            index: 1,
            iconPath: 'assets/data.svg',
            label: 'Training Data',
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required int index,
    required String iconPath,
    required String label,
  }) {
    final isActive = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 16,
              height: 16,
              color: isActive ? AppColor.black : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                color: isActive ? const Color(0xff111827) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
