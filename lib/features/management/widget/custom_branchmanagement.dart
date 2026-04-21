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
    bool isDesktop = true;

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

        Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffE5E7EB)),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                    children: [
                      if (isDesktop)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          color: AppColor.secondary,
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Business Sr.'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Business Name'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Location'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Manager'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Status'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Actions'),
                              ),
                            ],
                          ),
                        ),
                      CustomBranchRow(
                        slNo: "001",
                        businessname: "Tugatai",
                        location: "New York, NY",
                        name: "John Smith",
                        status: "active",
                      ),

                      CustomBranchRow(
                        slNo: "002",
                        businessname: "Tugatai",
                        location: "New York, NY",
                        name: "John Smith",
                        status: "active",
                      ),

                      CustomBranchRow(
                        slNo: "003",
                        businessname: "Tugatai",
                        location: "New York, NY",
                        name: "John Smith",
                        status: "active",
                      ),

                      CustomBranchRow(
                        slNo: "004",
                        businessname: "Tugatai",
                        location: "New York, NY",
                        name: "John Smith",
                        status: "active",
                      ),

                      ],
                ),
            ),
        ),
      ],
      ),
    );
  }
}
