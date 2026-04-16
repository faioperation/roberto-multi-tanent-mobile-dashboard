import 'package:flutter/material.dart';
import 'package:roberto/features/Orderbooking/widget/custom_order.dart';
import 'package:roberto/features/Orderbooking/widget/order_mod.dart';

class OrderRowItem extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onViewDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const OrderRowItem({
    super.key,
    required this.order,
    required this.onViewDetails,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Order ID
          Expanded(
            flex: 2,
            child: Text(
              order.orderId,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff111827),
              ),
            ),
          ),
          
          // Customer
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: order.avatarColor.withOpacity(0.1),
                  child: Text(
                    order.avatarInitials,
                    style: TextStyle(
                      color: order.avatarColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.customerName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff111827),
                        ),
                      ),
                      Text(
                        order.phone,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Address
          Expanded(
            flex: 2,
            child: Text(
              order.address,
              style: const TextStyle(
                color: Color(0xff6B7280),
              ),
            ),
          ),
          
          // Status
          Expanded(
            flex: 2,
            child: _buildStatusBadge(order.status),
          ),
          
          // Courier
          Expanded(
            flex: 2,
            child: Text(
              order.courier,
              style: const TextStyle(
                color: Color(0xff374151),
              ),
            ),
          ),
          
          // Shipping Charge
          Expanded(
            flex: 2,
            child: Text(
              '\$${order.shippingCharge.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff111827),
              ),
            ),
          ),
          
          // Delivery Time
          Expanded(
            flex: 2,
            child: Text(
              order.deliveryTime,
              style: const TextStyle(
                color: Color(0xff6B7280),
              ),
            ),
          ),
          
          // Actions
          Expanded(
            flex: 2,
            child: Row(
              children: [
                IconButton(
                  onPressed: onViewDetails,
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                  color: Colors.blue.shade600,
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  color: Colors.green.shade600,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline, size: 18),
                  color: Colors.red.shade600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    Color backgroundColor;
    Color textColor;
    String statusText;

    switch (status) {
      case OrderStatus.pending:
        backgroundColor = const Color(0xffFEF3C7);
        textColor = const Color(0xffD97706);
        statusText = 'Pending';
        break;
      case OrderStatus.confirmed:
        backgroundColor = const Color(0xffDBEAFE);
        textColor = const Color(0xff2563EB);
        statusText = 'Confirmed';
        break;
      case OrderStatus.delivered:
        backgroundColor = const Color(0xffD1FAE5);
        textColor = const Color(0xff059669);
        statusText = 'Delivered';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
