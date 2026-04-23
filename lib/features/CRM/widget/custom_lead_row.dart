import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class CustomLeadRow extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String tagText;
  final Color tagColor;
  final String time;
  final IconData socialIcon;
  final String socialText;

  final String? notes;

  const CustomLeadRow({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.tagText,
    required this.tagColor,
    required this.time,
    required this.socialIcon,
    required this.socialText,
    this.notes,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    if (!isDesktop) {
      return _buildMobileCard(context);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // NAME
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),

          // CONTACT (EMAIL + PHONE)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(email,
                    style: const TextStyle(fontSize: 14, color: AppColor.black)),
                const SizedBox(height: 4),
                Text(phone,
                    style: const TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),

          // SOURCE (ICON + TEXT)
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Icon(
                  socialIcon,
                  size: 18,
                  color: AppColor.black,
                ),
                const SizedBox(width: 6),
                Text(
                  socialText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),

          // STATUS (TAG)
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: tagColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tagText,
                  style: TextStyle(
                    fontSize: 12,
                    color: tagColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // LAST CONTACT
          Expanded(
            flex: 2,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: AppColor.black,
              ),
            ),
          ),

          // ACTIONS (EYE ICON)
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => _showLeadDetails(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.visibility, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: tagColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tagText,
                  style: TextStyle(
                    fontSize: 11,
                    color: tagColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(email,
              style: const TextStyle(fontSize: 14, color: AppColor.black)),
          const SizedBox(height: 4),
          Text(phone, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Icon(socialIcon, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    socialText,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => _showLeadDetails(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.visibility, size: 20, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showLeadDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: width < 600 ? width * 0.9 : 500,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Lead Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "View and manage lead information",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: AppColor.grey),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Data Grid
                width < 500
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailField("Name", name, isBold: true),
                          const SizedBox(height: 20),
                          _buildStatusField(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildDetailField("Name", name, isBold: true),
                          ),
                          Expanded(
                            child: _buildStatusField(),
                          ),
                        ],
                      ),
                const SizedBox(height: 20),
                width < 500
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailField("Email", email),
                          const SizedBox(height: 20),
                          _buildDetailField("Phone", phone),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildDetailField("Email", email),
                          ),
                          Expanded(
                            child: _buildDetailField("Phone", phone),
                          ),
                        ],
                      ),
                const SizedBox(height: 20),
                width < 500
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSourceField(),
                          const SizedBox(height: 20),
                          _buildDetailField("Last Contact", time),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildSourceField(),
                          ),
                          Expanded(
                            child: _buildDetailField("Last Contact", time),
                          ),
                        ],
                      ),
                const SizedBox(height: 20),

                // Notes
                const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  notes ?? "No notes available for this lead.",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Status",
          style: TextStyle(
            fontSize: 13,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: tagColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            tagText,
            style: TextStyle(
              fontSize: 12,
              color: tagColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSourceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Source",
          style: TextStyle(
            fontSize: 13,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(socialIcon, size: 16, color: AppColor.black),
            const SizedBox(width: 8),
            Text(
              socialText,
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailField(String label, String value, {bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: AppColor.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}