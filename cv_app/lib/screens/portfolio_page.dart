import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'Landing Page Jumat.co.id',
        'year': '2026',
        'techs': ['React JS', 'Laravel', 'MySQL'],
        'desc': 'Membangun antarmuka pengguna yang modern dan responsif untuk platform Jumat.co.id.',
        'role': 'Frontend / Backend',
        'link': 'https://jumat.co.id',
      },
      {
        'name': 'Website PT. Multi Informatika Solusindo',
        'year': '2025',
        'techs': ['React JS', 'Express JS', 'Node.js'],
        'desc': 'Mengembangkan portal website perusahaan dengan arsitektur berbasis JavaScript.',
        'role': 'Frontend / Backend',
        'link': 'https://multiinfosolusi.co.id',
      },
      {
        'name': 'Website p2bpt.id',
        'year': '2024',
        'techs': ['PHP', 'Laravel', 'MySQL'],
        'desc': 'Website untuk pemesanan bibit tanaman, dengan fitur katalog produk, keranjang belanja.',
        'role': 'Full-stack',
        'link': 'https://p2bpt.id',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Portofolio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Proyek yang Dikerjakan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ...projects.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              p['name'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D1F3C),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xFF2A4A7F)),
                            ),
                            child: Text(
                              p['year'] as String,
                              style: const TextStyle(
                                color: Color(0xFF4ADE80),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: (p['techs'] as List<dynamic>)
                            .map((tech) => Chip(
                              label: Text(
                                tech as String,
                                style: const TextStyle(fontSize: 10),
                              ),
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            ))
                            .toList(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        p['desc'] as String,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 11,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        p['role'] as String,
                        style: const TextStyle(
                          color: Color(0xFF4ADE80),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () async {
                          final url = Uri.parse(p['link'] as String);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url, mode: LaunchMode.externalApplication);
                          }
                        },
                        child: Text(
                          p['link'] as String,
                          style: const TextStyle(
                            color: Color(0xFF4ADE80),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}