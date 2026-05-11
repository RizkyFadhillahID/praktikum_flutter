import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final works = [
      {
        'name': 'PT. Solusi Wisata Kreatif',
        'location': 'Jakarta Selatan',
        'role': 'QA Testing & Junior DevOps',
        'period': '2024 - Sekarang',
        'status': 'Aktif',
        'bullets': [
          'Melakukan pengujian fungsionalitas dan performa aplikasi untuk memastikan kualitas rilis perangkat lunak.',
          'Berperan dalam pengelolaan infrastruktur dan pemeliharaan pipeline deployment.',
          'Berkolaborasi dengan tim developer untuk mengidentifikasi dan menyelesaikan bug sebelum produksi.',
        ],
      },
      {
        'name': 'PT. Multi Informatika Solusindo',
        'location': 'Jakarta Selatan',
        'role': 'IT Support (Intern)',
        'period': 'Januari 2022 - Juli 2022',
        'status': null,
        'bullets': [
          'Memberikan dukungan teknis harian terkait pemeliharaan perangkat keras dan jaringan.',
          'Melakukan troubleshooting berkala untuk mencegah downtime sistem.',
        ],
      },
      {
        'name': 'PT. Telekomunikasi Indonesia (Telkom)',
        'location': 'Kabupaten Aceh Tamiang',
        'role': 'IT Support (Intern)',
        'period': '2019',
        'status': null,
        'bullets': [
          'Membantu tim teknisi dalam operasional infrastruktur jaringan dan perbaikan perangkat komunikasi.',
        ],
      },
    ];

    final orgs = [
      {
        'name': 'Himpunan Mahasiswa Teknologi Informasi',
        'location': 'Politeknik Aceh',
        'role': 'Wakil Ketua Himpunan',
        'period': '2021 - 2022',
        'bullets': [
          'Mengoordinasi divisi-divisi himpunan dan merancang program kerja kemahasiswaan.',
          'Mengasah manajemen waktu, kolaborasi, dan kemampuan negosiasi sebagai jembatan aspirasi mahasiswa.',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Pengalaman')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pengalaman Kerja',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ...works.map(
              (w) => Padding(
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
                                w['name'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            if (w['status'] != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4ADE80),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  w['status'] as String,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          w['location'] as String,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          w['role'] as String,
                          style: const TextStyle(
                            color: Color(0xFF4ADE80),
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          w['period'] as String,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...(w['bullets'] as List<dynamic>).map(
                          (bullet) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '• ',
                                  style: TextStyle(color: Color(0xFF4ADE80)),
                                ),
                                Expanded(
                                  child: Text(
                                    bullet as String,
                                    style: const TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pengalaman Organisasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ...orgs.map(
              (o) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          o['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          o['location'] as String,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          o['role'] as String,
                          style: const TextStyle(
                            color: Color(0xFF4ADE80),
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          o['period'] as String,
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...(o['bullets'] as List<dynamic>).map(
                          (bullet) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '• ',
                                  style: TextStyle(color: Color(0xFF4ADE80)),
                                ),
                                Expanded(
                                  child: Text(
                                    bullet as String,
                                    style: const TextStyle(
                                      color: Color(0xFF94A3B8),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
