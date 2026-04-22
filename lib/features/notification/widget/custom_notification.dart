import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/app/app_color.dart';

class CustomNotification extends StatelessWidget {
  final String svgPath;
  final String title;
  final String subtitle;
  final String time;
  final bool showDot;

  const CustomNotification({
    super.key,
    required this.svgPath,
    required this.title,
    required this.subtitle,
    required this.time,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SvgPicture.asset(
            svgPath,
            width: 46,
            height: 46,
          ),

          const SizedBox(width: 25),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // TITLE + DOT
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff111827),
                      ),
                    ),

                    if (showDot) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColor.dot,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 2),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColor.grey,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.grey,
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