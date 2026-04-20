import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class CustomWidgetrule extends StatefulWidget {
  final String title;
  final String badgeText;
  final String description;

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomWidgetrule({
    super.key,
    required this.title,
    required this.badgeText,
    required this.description,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<CustomWidgetrule> createState() => _CustomWidgetruleState();
}

class _CustomWidgetruleState extends State<CustomWidgetrule> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isDesktop = width > 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 20 : 16,
        vertical: isDesktop ? 14 : 16,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: isDesktop ? null : BorderRadius.circular(12),
        border: isDesktop
            ? Border(bottom: BorderSide(color: Colors.grey.shade200))
            : Border.all(color: Colors.grey.shade200),
      ),
      margin: isDesktop ? EdgeInsets.zero : const EdgeInsets.only(bottom: 12),
      child: isDesktop
          ? Row(
        children: [
          // Title
          Expanded(
            flex: 2,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Badge
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F4F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.badgeText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description
          Expanded(
            flex: 3,
            child: Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.black,
              ),
            ),
          ),

          // Switch
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Transform.scale(
                scale: 0.75,
                child: Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                  activeColor: AppColor.greens,
                  materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ),

          // Actions
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  tooltip: "Edit",
                  onPressed: widget.onEdit,
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  tooltip: "Delete",
                  onPressed: widget.onDelete,
                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                  activeColor: AppColor.greens,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.badgeText,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColor.black,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: widget.onEdit,
                icon: const Icon(Icons.edit, size: 18),
                label: const Text("Edit"),
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: widget.onDelete,
                icon: const Icon(Icons.delete, size: 18),
                label: const Text("Delete"),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}