import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Orderbooking/widget/order_mod.dart';

class CustomViewdetails extends StatelessWidget {
  final OrderMod order;

  const CustomViewdetails({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: isMobile ? width * 0.9 : 450,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context),
              const SizedBox(height: 24),

              // Order ID
              _buildOrderIdSection(),
              const SizedBox(height: 20),

              // Customer Information
              _buildSectionTitle('Customer Information'),
              const SizedBox(height: 8),
              _buildInfoContainer([
                _buildIconRow(Icons.person_outline, order.customerName),
                const SizedBox(height: 12),
                _buildIconRow(Icons.phone_outlined, order.phone),
                const SizedBox(height: 12),
                _buildIconRow(Icons.location_on_outlined, order.address),
              ]),
              const SizedBox(height: 20),

              // Delivery Information
              _buildSectionTitle('Delivery Information'),
              const SizedBox(height: 8),
              _buildInfoContainer([
                _buildIconRow(
                    Icons.local_shipping_outlined, 'Courier: ${order.courier}'),
              ]),
              const SizedBox(height: 20),

              // Payment Information
              _buildSectionTitle('Payment'),
              const SizedBox(height: 8),
              _buildPaymentContainer(),
              const SizedBox(height: 24),

              // Buttons
              _buildActionButtons(context, width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Complete information about this order',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),

        const SizedBox(width: 8),

        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: Color(0xff6B7280), size: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildOrderIdSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order ID',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              order.orderId,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
            ),
          ],
        ),
        _buildStatusBadge(order.status),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xff111827),
      ),
    );
  }

  Widget _buildInfoContainer(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFEE2E2), // Pinkish color for consistency
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildPaymentContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffFEE2E2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.attach_money, size: 18, color: Color(0xff374151)),
              SizedBox(width: 8),
              Text('Total Amount',
                  style: TextStyle(color: Color(0xff374151), fontSize: 14)),
            ],
          ),
          Text(
            '\$${order.shippingCharge.toStringAsFixed(2)}',
            style: const TextStyle(
                color: Color(0xff111827),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, double width) {
    final bool isStack = width < 400;

    final updateBtn = ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
      ),
      child: const Center(
        child: Text('Update Status',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );

    final printBtn = OutlinedButton(
      onPressed: () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Text('Print Invoice',
            style: TextStyle(
                color: Color(0xff374151), fontWeight: FontWeight.w600)),
      ),
    );

    if (isStack) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          updateBtn,
          const SizedBox(height: 12),
          printBtn,
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: updateBtn),
        const SizedBox(width: 12),
        Expanded(child: printBtn),
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xff374151)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xff374151),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    late Color bg, fg;
    late String label;

    switch (status) {
      case OrderStatus.pending:
        bg = const Color(0xffFEF3C7);
        fg = const Color(0xffD97706);
        label = 'Pending';
        break;
      case OrderStatus.confirmed:
        bg = const Color(0xffDBEAFE);
        fg = const Color(0xff2563EB);
        label = 'Confirmed';
        break;
      case OrderStatus.delivered:
        bg = const Color(0xffD1FAE5);
        fg = const Color(0xff059669);
        label = 'Delivered';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
