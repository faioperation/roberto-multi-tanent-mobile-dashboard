import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Settings/widget/custom_profile.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Manage your system preferences and configurations',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),

          const SizedBox(height: 24),

          // CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Profile Information",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 19),

                // Avatar
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColor.secondary,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 36,
                      ),
                    ),
                    const SizedBox(width: 16),

                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                            ),
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                            },
                            child: const Text(
                              "Change Photo",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "JPG, PNG or GIF. Max size 2MB.",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Divider(color: Colors.grey.shade300),
                const SizedBox(height: 20),

                // Form
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;

                    return Column(
                      children: [
                        isMobile
                            ? Column(
                          children: [
                            CustomProfile(label: "First Name", hint: "System"),
                            const SizedBox(height: 16),
                            CustomProfile(label: "Last Name", hint: "Owner"),
                          ],
                        )
                            : Row(
                          children: [
                            Expanded(
                                child: CustomProfile(
                                   label:  "First Name", hint: "System")),
                            const SizedBox(width: 16),
                            Expanded(
                                child: CustomProfile(
                                    label: "Last Name", hint: "Owner")),
                          ],
                        ),

                        const SizedBox(height: 16),

                        CustomProfile(
                          label: "Email Address",
                          hint: "systemowner@company.com",
                          icon: Icons.email_outlined,
                        ),

                        const SizedBox(height: 16),

                        CustomProfile(
                          label: "Phone Number",
                          hint: "+1 (555) 000-0000",
                          icon: Icons.phone_android,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 30),

                // Save Button
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 140,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                      ),
                      onPressed: () {},
                      child: const Text("Save",
                        style: TextStyle(color: AppColor.white, fontSize: 14),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}