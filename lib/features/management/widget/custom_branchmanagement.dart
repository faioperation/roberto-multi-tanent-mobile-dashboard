import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/management/widget/custom_branch_row.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

class CustomBranchmanagement extends StatefulWidget {
  const CustomBranchmanagement({super.key});

  @override
  State<CustomBranchmanagement> createState() => _CustomBranchmanagementState();
}

class _CustomBranchmanagementState extends State<CustomBranchmanagement> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 24 : 16),
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "View and manage all your business branches",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          isDesktop ? _buildDesktopTable() : _buildMobileList(),
        ],
      ),
    );
  }

  Widget _buildDesktopTable() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              color: AppColor.secondary,
              child: const Row(
                children: [
                  Expanded(flex: 1, child: CustomHeadder(label: 'Sr.')),
                  Expanded(flex: 2, child: CustomHeadder(label: 'Branch Name')),
                  Expanded(flex: 2, child: CustomHeadder(label: 'Location')),
                  Expanded(flex: 2, child: CustomHeadder(label: 'Manager')),
                  Expanded(flex: 2, child: CustomHeadder(label: 'Status')),
                  Expanded(flex: 1, child: CustomHeadder(label: 'Actions')),
                ],
              ),
            ),
            _buildRows(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileList() {
    return _buildRows(isMobile: true);
  }

  Widget _buildRows({bool isMobile = false}) {
    final branches = [
      {
        "slNo": "001",
        "businessname": "Tugatai",
        "location": "New York, NY",
        "name": "John Smith",
        "status": "active"
      },
      {
        "slNo": "002",
        "businessname": "Tugatai",
        "location": "New York, NY",
        "name": "John Smith",
        "status": "active"
      },
      {
        "slNo": "003",
        "businessname": "Tugatai",
        "location": "New York, NY",
        "name": "John Smith",
        "status": "active"
      },
      {
        "slNo": "004",
        "businessname": "Tugatai",
        "location": "New York, NY",
        "name": "John Smith",
        "status": "inactive"
      },
    ];

    return Column(
      children: branches
          .map((b) => CustomBranchRow(
                slNo: b["slNo"]!,
                businessname: b["businessname"]!,
                location: b["location"]!,
                name: b["name"]!,
                status: b["status"]!,
                isMobile: isMobile,
              ))
          .toList(),
    );
  }
}
