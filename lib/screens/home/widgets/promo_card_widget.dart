import 'package:flutter/material.dart';
import 'package:fauzan_learning_platform/core/constants/colors.dart';

class PromoCardWidget extends StatelessWidget {
  const PromoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_offer,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'SBIT 2026 Terbaru',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            
            // Title
            const Text(
              'Kuasai Materi dengan Mentoring Live Interaktif',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            // Subtitle
            Text(
              'Paket Mentoring Premium (3 Bulan)\nRp 65.000/bulan',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            
            // Features
            Column(
              children: [
                _featureRow('Akses 50+ Video Materi'),
                _featureRow('Diskusi Strategi PTN dengan Mentor'),
                _featureRow('Pembahasan Soal & Review Materi'),
                _featureRow('Tips & Trik Tembak Kampus Impian'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.success,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}