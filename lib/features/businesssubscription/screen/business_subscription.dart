import 'package:flutter/material.dart';

class BusinessSubscription extends StatefulWidget {
  const BusinessSubscription({super.key});

  @override
  State<BusinessSubscription> createState() => _BusinessSubscriptionState();
}

class _BusinessSubscriptionState extends State<BusinessSubscription> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subscription Management',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff111827),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Configure and train your AI assistant',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

        ]
    );
  }
}
