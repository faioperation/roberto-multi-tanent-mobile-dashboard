import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPlan extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final List<String> features;
  final String iconPath;

  const CustomPlan({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.features,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // MAIN CARD
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 16),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const TextSpan(
                      text: '/month',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // FEATURES
              ...features.map((f) => _FeatureItem(text: f)).toList(),
            ],
          ),
        ),

        // TOP ICON
        Positioned(
          top: -25,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class _FeatureItem extends StatelessWidget {
  final String text;
  const _FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            size: 16,
            color: Color(0xFF7C6FF7),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}