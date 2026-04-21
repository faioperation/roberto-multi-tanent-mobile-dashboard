import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class CustomUserRow extends StatefulWidget {
  final String slNo;
  final String username;
  final String mail;
  final String location;
  final String status;

  const CustomUserRow({
    super.key,
    required this.slNo,
    required this.username,
    required this.mail,
    required this.location,
    required this.status,
  });

  @override
  State<CustomUserRow> createState() => _CustomUserRowState();
}

class _CustomUserRowState extends State<CustomUserRow> {
  late String _currentStatus;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.status;
  }

  bool get _isActive => _currentStatus.toLowerCase() == 'active';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          // SL No
          Expanded(
            flex: 1,
            child: Text(widget.slNo),
          ),

          // Name
          Expanded(
            flex: 2,
            child: Text(widget.username),
          ),

          // Contact
          Expanded(
            flex: 2,
            child: Text(widget.mail),
          ),

          // Location
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppColor.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.location,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Status
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _isActive
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: _isActive
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFFEF5350),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentStatus,
                    isDense: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      color: _isActive
                          ? const Color(0xFF2E7D32)
                          : const Color(0xFFC62828),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'active',
                        child: Text('Active', style: TextStyle(fontSize: 12)),
                      ),
                      DropdownMenuItem(
                        value: 'inactive',
                        child: Text('Inactive', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _currentStatus = value;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ),

          // Actions (Edit + Eye)
          Expanded(
            flex: 2,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    print("Edit clicked");
                  },
                  child: const Icon(Icons.edit, size: 18),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    print("View clicked");
                  },
                  child: const Icon(Icons.remove_red_eye, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}