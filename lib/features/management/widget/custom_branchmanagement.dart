import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class CustomBranchmanagement extends StatefulWidget {
  const CustomBranchmanagement({super.key});

  @override
  State<CustomBranchmanagement> createState() => _CustomBranchmanagementState();
}

class _CustomBranchmanagementState extends State<CustomBranchmanagement> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

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
        const Text(
        "Branch List",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 6),
      const Text(
        "View and manage all Branch",
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 26),
      ]
      )
    );
  }
}
