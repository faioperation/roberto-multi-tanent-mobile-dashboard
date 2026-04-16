import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Orderbooking/widget/order_mod.dart';

class CustomOrders extends StatelessWidget {
  const CustomOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //  NOW OUTSIDE BUILD (FIXED)
  void showUpdateStatusDialog({
    required BuildContext context,
    required OrderMod order,
    required void Function(OrderStatus newStatus) onUpdate,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        OrderStatus selectedStatus = order.status;
        final TextEditingController notesController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: 450,
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: AppColor.primary,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Update Order Status',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff111827),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                            color: Color(0xff9CA3AF),
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Update the delivery status for order ${order.orderId}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xff6B7280),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ORDER INFO
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          _buildDialogInfoRow('Order ID:', order.orderId),
                          const SizedBox(height: 8),
                          _buildDialogInfoRow(
                              'Customer:', order.customerName),
                          const SizedBox(height: 8),
                          _buildDialogStatusRow(
                              'Current Status:', order.status),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'New Status',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff374151),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<OrderStatus>(
                          value: selectedStatus,
                          isExpanded: true,
                          items: OrderStatus.values.map((status) {
                            final label = status.name[0].toUpperCase() +
                                status.name.substring(1);

                            return DropdownMenuItem(
                              value: status,
                              child: Row(
                                children: [
                                  Icon(
                                    status == OrderStatus.confirmed
                                        ? Icons.check_circle_outline
                                        : status == OrderStatus.delivered
                                        ? Icons.check_circle
                                        : Icons.access_time,
                                    size: 16,
                                    color: AppColor.black,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    label,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (v) {
                            if (v != null) {
                              setDialogState(() {
                                selectedStatus = v;
                              });
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Notes (Optional)',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff374151),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextField(
                      controller: notesController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add any notes about this update...',
                        hintStyle: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff9CA3AF),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: Color(0xffD1D5DB)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: Color(0xffD1D5DB)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFF1F2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Customer will be notified that their order is confirmed and on the way.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffBE123C),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(dialogContext),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            onUpdate(selectedStatus);
                            Navigator.pop(dialogContext);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Confirm Update'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDialogInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }

  Widget _buildDialogStatusRow(String title, OrderStatus status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(status.name),
      ],
    );
  }
}