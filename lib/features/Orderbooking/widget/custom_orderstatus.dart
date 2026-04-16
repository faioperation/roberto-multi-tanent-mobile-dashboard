import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_headder.dart';

// ── Data Model ──────────────────────────────────────────────────────────────
enum OrderStatus { pending, confirmed, delivered }

class OrderMod {
  final String orderId;
  final String customerName;
  final String phone;
  final String address;
  final OrderStatus status;
  final String courier;
  final double shippingCharge;
  final String deliveryTime;
  final String avatarInitials;
  final Color avatarColor;

  const OrderMod({
    required this.orderId,
    required this.customerName,
    required this.phone,
    required this.address,
    required this.status,
    required this.courier,
    required this.shippingCharge,
    required this.deliveryTime,
    required this.avatarInitials,
    required this.avatarColor,
  });
}

// ── Status Badge ─────────────────────────────────────────────────────────────
class _StatusBadge extends StatelessWidget {
  final OrderStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final Map<OrderStatus, _BadgeStyle> styles = {
      OrderStatus.pending: _BadgeStyle(
        label: 'Pending',
        bg: const Color(0xFFFAEEDA),
        dotColor: const Color(0xFFBA7517),
        textColor: const Color(0xFF854F0B),
      ),
      OrderStatus.confirmed: _BadgeStyle(
        label: 'Confirmed',
        bg: const Color(0xFFE6F1FB),
        dotColor: const Color(0xFF378ADD),
        textColor: const Color(0xFF185FA5),
      ),
      OrderStatus.delivered: _BadgeStyle(
        label: 'Delivered',
        bg: const Color(0xFFEAF3DE),
        dotColor: const Color(0xFF639922),
        textColor: const Color(0xFF3B6D11),
      ),
    };

    final s = styles[status]!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 7,
            decoration: BoxDecoration(
              color: s.dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            s.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: s.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeStyle {
  final String label;
  final Color bg, dotColor, textColor;
  const _BadgeStyle({
    required this.label,
    required this.bg,
    required this.dotColor,
    required this.textColor,
  });
}

// ── Avatar Circle ─────────────────────────────────────────────────────────────
class _Avatar extends StatelessWidget {
  final String initials;
  final Color color;
  const _Avatar({required this.initials, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ── Action Icon Button ────────────────────────────────────────────────────────
class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback? onTap;
  const _ActionIcon({required this.icon, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: 14, color: color ?? Colors.grey.shade600),
      ),
    );
  }
}