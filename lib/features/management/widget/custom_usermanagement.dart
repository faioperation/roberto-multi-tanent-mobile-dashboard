import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/management/widget/custom_user_row.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

class CustomUsermanagement extends StatefulWidget {
  const CustomUsermanagement({super.key});

  @override
  State<CustomUsermanagement> createState() => _CustomUsermanagementState();
}

class _CustomUsermanagementState extends State<CustomUsermanagement> {
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
                "User List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "View and manage all User",
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
                                child: CustomHeadder(label: 'Sr.'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'User Name'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Mail'),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomHeadder(label: 'Address'),
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

                      CustomUserRow(
                        slNo: "001",
                        username: "John smith",
                        mail: "john@gmail.com",
                        location: "New York, NY",
                        status: "active",
                      ),

                      CustomUserRow(
                        slNo: "002",
                        username: "John smith",
                        mail: "john@gmail.com",
                        location: "New York, NY",
                        status: "active",
                      ),

                      CustomUserRow(
                        slNo: "003",
                        username: "John smith",
                        mail: "john@gmail.com",
                        location: "New York, NY",
                        status: "active",
                      ),

                      CustomUserRow(
                        slNo: "004",
                        username: "John smith",
                        mail: "john@gmail.com",
                        location: "New York, NY",
                        status: "active",
                      ),
                      ]
                )
                )
            )
            ]
        )
    );
  }
}
