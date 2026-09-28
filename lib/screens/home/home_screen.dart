import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProv = context.watch<UserProvider>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF4A90E2),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2D79E6), Color(0xFF56CCF2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showProfileDialog(context),
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Color(0xFF2D79E6)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userProv.user.name,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          userProv.user.university,
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        userProv.user.isPremium ? 'PRO' : 'FREE',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("SNBT 2026 Terbaru", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            const Text("Kuasai Materi dengan Mentoring Live Interaktif", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => context.read<UserProvider>().togglePremium(),
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2D79E6)),
                              child: Text(
                                userProv.user.isPremium ? "Batalkan Langganan" : "Akses Penuh Sekarang",
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _menuItem(Icons.menu_book, "Materi"),
                      _menuItem(Icons.edit_note, "Latihan"),
                      _menuItem(Icons.assignment, "TryOut"),
                      _menuItem(Icons.ondemand_video, "Video"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text("Misi Harian", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  _taskTile("Kerjakan 10 Soal Latihan", "3/10"),
                  _taskTile("Tonton 3 Video Materi", "0/3"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showProfileDialog(BuildContext context) {
    final userProv = context.read<UserProvider>();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(radius: 30, child: Icon(Icons.person, size: 30)),
            const SizedBox(height: 10),
            Text(userProv.user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(userProv.user.isPremium ? "Member Premium" : "Free User", style: const TextStyle(color: Colors.blue)),
            const Divider(height: 30),
            ElevatedButton(
              onPressed: () {
                userProv.togglePremium();
                Navigator.pop(context);
              },
              child: Text(userProv.user.isPremium ? "Ubah ke Free" : "Upgrade Premium"),
            )
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _taskTile(String title, String progress) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.check_box_outline_blank, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        trailing: Text(progress, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }
}