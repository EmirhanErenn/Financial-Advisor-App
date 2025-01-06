import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  final bool isOpen; // Sidebar'ın açık olup olmadığını kontrol eden parametre
  final VoidCallback onClose; // Sidebar'ı kapatmak için bir callback

  const SidebarWidget({
    Key? key,
    required this.isOpen,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isOpen ? 250 : 0, // Sidebar'ın genişliği
      decoration: const BoxDecoration(
        color: Color(0xFF003366), // Sidebar arka plan rengi
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          _buildNavItem(icon: Icons.home, label: 'Anasayfa', onTap: () {
            Navigator.pushNamed(context, '/admin_home');
            onClose();
          }),
          _buildNavItem(icon: Icons.payment, label: 'Ödemeler', onTap: () {}),
          _buildNavItem(icon: Icons.person, label: 'Profil', onTap: () {}),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: onClose, // Sidebar'ı kapatmak için onClose'u çağırıyoruz
              icon: const Icon(Icons.close, color: Colors.white),
              label: const Text(
                "Kapat",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
