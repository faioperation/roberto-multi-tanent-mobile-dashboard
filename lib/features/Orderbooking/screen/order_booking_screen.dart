import 'package:flutter/material.dart';
import 'package:roberto/features/Tenant%20Management%20/widget/custom_stat_card.dart';
import 'package:roberto/features/Orderbooking/widget/custom_order.dart';
import 'package:roberto/features/Tenant%20Management%20/screen/tenant_screen.dart';

class OrderBookingScreen extends StatefulWidget {
  const OrderBookingScreen({super.key});

  @override
  State<OrderBookingScreen> createState() => _OrderBookingScreenState();
}

class _OrderBookingScreenState extends State<OrderBookingScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // HEADER
      Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Booking',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Manage plans, billing, and subscriptions',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),

          const SizedBox(height: 24),
      // ── Stat Cards ──────────────────────────────────────────────────────
      LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          final cards = [
            CustomStatCard(
              label: 'Total Orders',
              value: '856',
              iconPath: "assets/order1.svg",
            ),
            CustomStatCard(
              label: 'Pending',
              value: '124',
              iconPath: "assets/pending.svg",
            ),
            CustomStatCard(
              label: 'Confirmed',
              value: '89',
              iconPath: "assets/confirm.svg",
            ),
            CustomStatCard(
              label: 'Delivered',
              value: '643',
              iconPath: "assets/deliver.svg",
            ),
          ];
          return isWide
              ? Row(
            children: cards
                .map((c) =>
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: cards.indexOf(c) < 3 ? 16 : 0),
                    child: c,
                  ),
                ))
                .toList(),
          )
              : Column(
            children: cards
                .map((c) =>
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: c,
                ))
                .toList(),
          );
        },
      ),
      const SizedBox(height: 20),
      CustomOrder(),

      const SizedBox(height: 20),

      // Column headers
      Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12),
        color: const Color(0xffF9FAFB),
        child: const Row(
          children: [
            Expanded(
                flex: 3,
                child: _HeaderCell(label: 'Business Name')),
            Expanded(
                flex: 3,
                child: _HeaderCell(label: 'Owner Name')),
            Expanded(
                flex: 4, child: _HeaderCell(label: 'Contact')),
            Expanded(flex: 2, child: _HeaderCell(label: 'Plan')),
            Expanded(flex: 2, child: _HeaderCell(label: 'Status')),
            Expanded(
                flex: 2,
                child: _HeaderCell(label: 'Plan Price')),
            Expanded(
                flex: 1,
                child: _HeaderCell(label: 'Actions')),
          ],
        ),
      ),


        ],
    );
  }
}

