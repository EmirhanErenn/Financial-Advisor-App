import 'package:flutter/material.dart';

class SidebarWidget extends StatefulWidget {
  final bool isOpen;
  final VoidCallback onClose;

  const SidebarWidget({
    Key? key,
    required this.isOpen,
    required this.onClose,
  }) : super(key: key);

  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Sol taraftan başla
      end: Offset.zero, // Görünür hale gel
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(covariant SidebarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen) {
      _animationController.forward(); // Açılma animasyonu
    } else {
      _animationController.reverse(); // Kapanma animasyonu
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: 250, // Sidebar genişliği
        color: const Color(0xFF003366),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: widget.onClose,
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Anasayfa', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.payment_outlined, color: Colors.white),
              title: const Text('Ödemeler', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Profil', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
