import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Auth/widget/custom_textfield.dart';

class CreateOrderDialog extends StatefulWidget {
  const CreateOrderDialog({super.key});

  @override
  State<CreateOrderDialog> createState() => _CreateOrderDialogState();
}

class _CreateOrderDialogState extends State<CreateOrderDialog> {
  int _quantity = 1;
  String? _selectedPaymentMethod = 'Cash on delivery';
  String? _selectedStatus = 'paid';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create New Order",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Create a new order for a customer",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.black54, size: 20),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Form Content
              Flexible(
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 450;
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("Customer Name"),
                          const CustomTextfield(hintText: "Enter customer name"),
                          const SizedBox(height: 16),
                          
                          if (isMobile) ... [
                            _buildLabel("Phone Number"),
                            const CustomTextfield(hintText: "+1 (555) 000-0000"),
                            const SizedBox(height: 16),
                            _buildLabel("Email (Optional)"),
                            const CustomTextfield(hintText: "customer@email.com"),
                          ] else 
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Phone Number"),
                                      const CustomTextfield(hintText: "+1 (555) 000-0000"),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Email (Optional)"),
                                      const CustomTextfield(hintText: "customer@email.com"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 16),
                          
                          _buildLabel("Delivery Address ( From )"),
                          const CustomTextfield(hintText: "Enter location"),
                          const SizedBox(height: 16),
                          
                          _buildLabel("To"),
                          const CustomTextfield(hintText: "Enter location"),
                          const SizedBox(height: 16),
                          
                          if (isMobile) ... [
                            _buildLabel("Select Product"),
                            const CustomTextfield(hintText: "Type product Name"),
                            const SizedBox(height: 16),
                            _buildLabel("Select Size"),
                            const CustomTextfield(hintText: "Type size/weight"),
                          ] else 
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Select Product"),
                                      const CustomTextfield(hintText: "Type product Name"),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Select Size"),
                                      const CustomTextfield(hintText: "Type size/weight"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 16),

                          if (isMobile) ... [
                            _buildLabel("Quantity"),
                            _buildQuantityDropdown(),
                            const SizedBox(height: 16),
                            _buildLabel("Price"),
                            const CustomTextfield(hintText: "Enter price"),
                          ] else 
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Quantity"),
                                      _buildQuantityDropdown(),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Price"),
                                      const CustomTextfield(hintText: "Enter price"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 16),

                          if (isMobile) ... [
                            _buildLabel("Payment Method"),
                            _buildDropdown(
                              hint: "Cash on delivery",
                              value: _selectedPaymentMethod,
                              items: ["Cash on delivery", "Card payment"],
                              onChanged: (val) => setState(() => _selectedPaymentMethod = val),
                            ),
                            const SizedBox(height: 16),
                            _buildLabel("Status"),
                            _buildDropdown(
                              hint: "paid",
                              value: _selectedStatus,
                              items: ["paid", "unpaid"],
                              onChanged: (val) => setState(() => _selectedStatus = val),
                            ),
                          ] else 
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Payment Method"),
                                      _buildDropdown(
                                        hint: "Cash on delivery",
                                        value: _selectedPaymentMethod,
                                        items: ["Cash on delivery", "Card payment"],
                                        onChanged: (val) => setState(() => _selectedPaymentMethod = val),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildLabel("Status"),
                                      _buildDropdown(
                                        hint: "paid",
                                        value: _selectedStatus,
                                        items: ["paid", "Pending"],
                                        onChanged: (val) => setState(() => _selectedStatus = val),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 16),

                          _buildLabel("Order Notes (Optional)"),
                          const CustomTextfield(
                            hintText: "Add any special instructions",
                            maxLines: 3,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Actions
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text("Create Order", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: Text(hint, style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade400, size: 20),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 14, color: Colors.black87)))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildQuantityDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$_quantity", style: const TextStyle(color: Colors.black87, fontSize: 14)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => setState(() => _quantity++),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.keyboard_arrow_up, size: 14, color: Colors.grey.shade600),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_quantity > 1) setState(() => _quantity--);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.keyboard_arrow_down, size: 14, color: Colors.grey.shade600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
