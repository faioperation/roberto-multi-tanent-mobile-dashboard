import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';

class CustomUserRow extends StatefulWidget {
  final String slNo;
  final String username;
  final String mail;
  final String location;
  final String status;
  final bool isMobile;

  const CustomUserRow({
    super.key,
    required this.slNo,
    required this.username,
    required this.mail,
    required this.location,
    required this.status,
    this.isMobile = false,
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
    if (widget.isMobile) {
      return _buildMobileCard();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          // SL No
          Expanded(
            flex: 1,
            child: Text(widget.slNo, style: const TextStyle(fontSize: 13)),
          ),

          // Name
          Expanded(
            flex: 2,
            child: Text(widget.username,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          ),

          // Contact
          Expanded(
            flex: 2,
            child: Text(widget.mail,
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ),

          // Location
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: AppColor.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          // Status
          Expanded(
            flex: 2,
            child: _buildStatusDropdown(),
          ),

          // Actions
          Expanded(
            flex: 1,
            child: Row(
              children: [
                _buildActionIcon(Icons.edit_outlined, Colors.blue, () {}),
                const SizedBox(width: 8),
                _buildActionIcon(Icons.remove_red_eye_outlined, Colors.grey, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.slNo,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildStatusDropdown(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.username,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff111827),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.email_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(widget.mail, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(widget.location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildActionIcon(Icons.edit_outlined, Colors.blue, () {}),
              const SizedBox(width: 12),
              _buildActionIcon(Icons.remove_red_eye_outlined, Colors.grey, () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _isActive ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _isActive ? const Color(0xFF4CAF50) : const Color(0xFFEF5350),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _currentStatus,
          isDense: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 14,
            color: _isActive ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
          ),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: _isActive ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
          ),
          items: const [
            DropdownMenuItem(value: 'active', child: Text('Active')),
            DropdownMenuItem(value: 'inactive', child: Text('Inactive')),
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
    );
  }

  Widget _buildActionIcon(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}