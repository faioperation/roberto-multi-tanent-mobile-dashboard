import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app/app_color.dart';

class SidebarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: isActive ? AppColor.primary : Colors.transparent,

        leading: SvgPicture.asset(
          iconPath,
          width: 22,
          height: 22,
          colorFilter: ColorFilter.mode(
            isActive ? Colors.white : Colors.grey[600]!,
            BlendMode.srcIn,
          ),
        ),

        title: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[600],
            fontSize: 14,
            fontWeight:
            isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}