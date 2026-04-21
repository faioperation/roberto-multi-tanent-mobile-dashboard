import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/app/app_color.dart';

class CustomMedia extends StatefulWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final bool isConnected;

  const CustomMedia({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.isConnected,
  });

  @override
  State<CustomMedia> createState() => _CustomMediaState();
}

class _CustomMediaState extends State<CustomMedia> {
  late bool _isConnected;

  @override
  void initState() {
    super.initState();
    _isConnected = widget.isConnected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ICON
          SvgPicture.asset(
            widget.iconPath,
            height: 45,
            width: 45,
          ),

          const SizedBox(width: 22),

          // TITLE + SUBTITLE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),

          // BUTTONS (same line)
          Row(
            children: [
              if (_isConnected) ...[
                _buildConnectedButton(),
                const SizedBox(width: 10),
              ],
              _buildActionButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.greens),
      ),
      child: Row(
        children: [
          Icon(Icons.check, size: 14, color: AppColor.greens),
          const SizedBox(width: 4),
          Text(
            'Connected',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColor.greens,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isConnected = !_isConnected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isConnected ? AppColor.primary : AppColor.grey,
          ),
        ),
        child: Text(
          _isConnected ? 'Disconnect' : 'Connect',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _isConnected ? AppColor.primary : AppColor.black,
          ),
        ),
      ),
    );
  }
}