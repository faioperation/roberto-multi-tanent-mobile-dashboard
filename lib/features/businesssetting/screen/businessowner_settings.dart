import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/features/businesssetting/widget/custom_media.dart';

class BusinessownerSettings extends StatefulWidget {
  const BusinessownerSettings({super.key});

  @override
  State<BusinessownerSettings> createState() => _BusinessownerSettingsState();
}

class _BusinessownerSettingsState extends State<BusinessownerSettings> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: isMobile ? 22 : 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff111827),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Manage your system preferences and configurations',
                style: TextStyle(
                  fontSize: isMobile ? 13 : 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                // RIGHT COLUMN
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/msg.svg",
                            height: 44,
                            width: 44,
                          ),
                          const Text(
                            "Social Media Connections",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Connect your social media accounts to manage all conversations in one place",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.grey,
                        ),
                      ),

                      SizedBox(height: 15),

                      CustomMedia(
                        iconPath: 'assets/fac.svg',
                        title: 'Facebook',
                        subtitle: 'Connected: @mybusiness',
                        isConnected: true,
                      ),

                      SizedBox(height: 15),

                      CustomMedia(
                        iconPath: 'assets/inst.svg',
                        title: 'Instagram',
                        subtitle: 'Connected: @mybusiness_insta',
                        isConnected: true,
                      ),

                      SizedBox(height: 15),

                      CustomMedia(
                        iconPath: 'assets/msg.svg',
                        title: 'WhatsApp',
                        subtitle: 'Connected: +1 (555) 123-4567',
                        isConnected: true,
                      ),

                      SizedBox(height: 15),

                    ],
                  ),
                ),
              ],
            ),
          ),
      ]
    );
  }
}
