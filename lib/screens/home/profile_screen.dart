import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProv = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan', style: TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: const Color(0xFF2D79E6),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.orange, size: 36),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${userProv.user.streak} Streak Day", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const Text("Jaga streak belajarmu tetap aktif!", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit, color: Colors.blue),
                    title: const Text('Edit Profile'),
                    subtitle: Text(userProv.user.name),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () => _editNameDialog(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.star, color: Colors.amber),
                    title: const Text('Status Langganan'),
                    trailing: Switch(
                      value: userProv.user.isPremium,
                      onChanged: (val) => context.read<UserProvider>().togglePremium(),
                    ),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(Icons.lock_outline, color: Colors.blue),
                    title: Text('Ubah Password'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text('Log out', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _editNameDialog(BuildContext context) {
    final controller = TextEditingController(text: context.read<UserProvider>().user.name);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ubah Nama'),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().updateName(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}