import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Photo
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF4ADE80), Color(0xFF22C55E)],
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 110,
                    height: 110,
                    color: const Color(0xFF1E3A5F),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 56,
                      color: Color(0xFF4ADE80),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Name
            const Text(
              'Rizky Fadhillah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF4ADE80).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF4ADE80).withValues(alpha: 0.5),
                ),
              ),
              child: const Text(
                'Software Developer  |  QA & Junior DevOps',
                style: TextStyle(
                  color: Color(0xFF4ADE80),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Location
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 13,
                  color: Color(0xFF94A3B8),
                ),
                SizedBox(width: 4),
                Text(
                  'Jakarta',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Contact Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4ADE80),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Kontak',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        GestureDetector(
                          onTap: () => _launchUrl('tel:+6285121159390'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1F3C),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(
                                  0xFF4ADE80,
                                ).withValues(alpha: 0.35),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.phone_rounded,
                                  size: 15,
                                  color: Color(0xFF4ADE80),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  '+62 851-2115-9390',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _launchUrl(
                            'mailto:itsrizkyfadhillah@gmail.com?subject=Halo Rizky',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1F3C),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(
                                  0xFF4ADE80,
                                ).withValues(alpha: 0.35),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.email_rounded,
                                  size: 15,
                                  color: Color(0xFF4ADE80),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Gmail',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _launchUrl(
                            'https://www.linkedin.com/in/rizky-fadhillah-bb8097298/',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1F3C),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(
                                  0xFF4ADE80,
                                ).withValues(alpha: 0.35),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  size: 13,
                                  color: Color(0xFF4ADE80),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'LinkedIn',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _launchUrl(
                            'https://www.instagram.com/rizkyfdlh_25/',
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1F3C),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(
                                  0xFF4ADE80,
                                ).withValues(alpha: 0.35),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.instagram,
                                  size: 13,
                                  color: Color(0xFF4ADE80),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Instagram',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Summary Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4ADE80),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Ringkasan Profesional',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Lulusan D3 Teknologi Informasi dengan IPK 3.83/4.00 dan '
                      'pengalaman praktis dalam pengembangan perangkat lunak, '
                      'pengujian kualitas (QA), serta operasional IT (DevOps). '
                      'Berkeahlian dalam membangun aplikasi web & mobile menggunakan '
                      'React.js, Flutter, dan Laravel. Memiliki jiwa kepemimpinan '
                      'yang terbukti sebagai Wakil Ketua Himpunan Mahasiswa, '
                      'didukung oleh disiplin tinggi, loyalitas, dan adaptabilitas.',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 13,
                        height: 1.65,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Stats Row
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.school_rounded,
                            color: Color(0xFF4ADE80),
                            size: 22,
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '3.83',
                            style: TextStyle(
                              color: Color(0xFF4ADE80),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'IPK',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.work_rounded,
                            color: Color(0xFF4ADE80),
                            size: 22,
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '2+',
                            style: TextStyle(
                              color: Color(0xFF4ADE80),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Tahun Kerja',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.folder_rounded,
                            color: Color(0xFF4ADE80),
                            size: 22,
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '3',
                            style: TextStyle(
                              color: Color(0xFF4ADE80),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Proyek',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
