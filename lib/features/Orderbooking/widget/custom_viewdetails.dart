import 'package:flutter/material.dart';

class CustomViewdetails extends StatelessWidget {
  final String orderId;
  final String status;
  final String customerName;
  final String customerPhone;
  final String customerAddress;
  final String courierStatus;
  final double totalAmount;

  const CustomViewdetails({
    super.key,
    this.orderId = '#ORD-001',
    this.status = 'Pending',
    this.customerName = 'Sarah Johnson',
    this.customerPhone = '+1 (555) 123-4567',
    this.customerAddress = '123 Main St, New York, NY 10001',
    this.courierStatus = 'Not assigned',
    this.totalAmount = 245.00,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──
            _buildHeader(context),

            const SizedBox(height: 16),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 16),

            // ── Order ID ──
            _buildOrderIdRow(),

            const SizedBox(height: 16),

            // ── Customer Information ──
            _buildSectionTitle('Customer Information'),
            const SizedBox(height: 8),
            _buildInfoCard(children: [
              _buildInfoRow(Icons.person_outline, customerName),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.phone_outlined, customerPhone),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.location_on_outlined, customerAddress),
            ]),

            const SizedBox(height: 16),

            // ── Delivery Information ──
            _buildSectionTitle('Delivery Information'),
            const SizedBox(height: 8),
            _buildInfoCard(children: [
              _buildInfoRow(
                Icons.local_shipping_outlined,
                'Courier: $courierStatus',
              ),
            ]),

            const SizedBox(height: 16),

            // ── Payment ──
            _buildSectionTitle('Payment'),
            const SizedBox(height: 8),
            _buildInfoCard(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoRow(Icons.attach_money, 'Total Amount'),
                  Text(
                    '\$${totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ]),

            const SizedBox(height: 24),

            // ── Action Buttons ──
            _buildActionButtons(context),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Complete information about this order',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.close, size: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  // ── Order ID Row ─────────────────────────────────────────────────────────────

  Widget _buildOrderIdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order ID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              orderId,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        _buildStatusChip(status),
      ],
    );
  }

  // ── Status Chip ──────────────────────────────────────────────────────────────

  Widget _buildStatusChip(String statusText) {
    Color chipColor;
    Color textColor;

    switch (statusText.toLowerCase()) {
      case 'pending':
        chipColor = const Color(0xFFFFF3E0);
        textColor = const Color(0xFFE65100);
        break;
      case 'delivered':
        chipColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF2E7D32);
        break;
      case 'cancelled':
        chipColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFC62828);
        break;
      default:
        chipColor = const Color(0xFFE3F2FD);
        textColor = const Color(0xFF1565C0);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(20),
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

  // ── Section Title ────────────────────────────────────────────────────────────

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A1A1A),
      ),
    );
  }

  // ── Info Card ────────────────────────────────────────────────────────────────

  Widget _buildInfoCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFE0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  // ── Info Row ─────────────────────────────────────────────────────────────────

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, color: Color(0xFF333333)),
          ),
        ),
      ],
    );
  }

  // ── Action Buttons ───────────────────────────────────────────────────────────

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Update status logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Update Status',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Print invoice logic
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1A1A1A),
              padding: const EdgeInsets.symmetric(vertical: 13),
              side: const BorderSide(color: Color(0xFFDDDDDD)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Print Invoice',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

