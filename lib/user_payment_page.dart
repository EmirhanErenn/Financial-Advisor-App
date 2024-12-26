import 'package:financial_advisor_app/widgets/SidebarWidget_User.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
//code
=======

>>>>>>> 97498f8 (VersionUpdateEx)
class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({Key? key}) : super(key: key);

  @override
<<<<<<< HEAD
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  bool isSidebarOpen = false;

  Widget buildPageContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Kullanıcı Ödeme Sayfası İçeriği'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user_home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003366),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
=======
  _UserPaymentPageState createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  String? selectedPayment; // Seçilen ödeme

  // Modal pencere açmaa
  void showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Ödeme Seçimi'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPayment = "Su Faturası - 100 TL";
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: selectedPayment == "Su Faturası - 100 TL" 
                              ? Colors.white 
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Su Faturası - 100 TL',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          if (selectedPayment == "Su Faturası - 100 TL")
                            Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: selectedPayment != null
                        ? () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("$selectedPayment ödendi!")),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Ödeme Yap',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
>>>>>>> 97498f8 (VersionUpdateEx)
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Kapat'),
                ),
              ],
            );
          },
        );
      },
    );
  }

<<<<<<< HEAD
  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
=======
  // Ödenmiş ve ödenmemiş ödemeler tablosu
  Widget buildPaymentsTable(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // Ekran yüksekliğinin %60'ı
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            columnSpacing: 0,
            horizontalMargin: 0,
            columns: [
              DataColumn(
                label: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Ücret Adı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              DataColumn(
                label: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Tutar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
            rows: [
              // Örnek veri: Ödenmiş ödeme
              DataRow(
                cells: [
                  const DataCell(Text('Elektrik Faturası')),
                  DataCell(
                    Container(
                      color: Colors.green, // Ödenmişse yeşil
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('200 TL'),
                    ),
                  ),
                ],
              ),
              // Örnek veri: Ödenmemiş ödeme
              DataRow(
                cells: [
                  const DataCell(Text('Su Faturası')),
                  DataCell(
                    Container(
                      color: Colors.red, // Ödenmemişse kırmızı
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('100 TL'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
>>>>>>> 97498f8 (VersionUpdateEx)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text(
          'Taner Eren Mobile App',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: Image.asset(
                  'lib/assets/images/malii.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 60,
      ),
<<<<<<< HEAD
      body: Stack(
        children: [
          buildPageContent(context),
          SidebarWidget(isOpen: isSidebarOpen, onClose: toggleSidebar)
        ],
      ) // Metodun çağrılması
=======
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const Text(
              'Ödemelerim',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DataTable(
                    columnSpacing: 0,
                    horizontalMargin: 0,
                    columns: [
                      DataColumn(
                        label: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            'Ücret Adı',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            'Tutar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      // Örnek veri: Ödenmiş ödeme
                      DataRow(
                        cells: [
                          const DataCell(Text('Elektrik Faturası')),
                          DataCell(
                            Container(
                              color: Colors.green, // Ödenmişse yeşil
                              padding: const EdgeInsets.all(8.0),
                              child: const Text('200 TL'),
                            ),
                          ),
                        ],
                      ),
                      // Örnek veri: Ödenmemiş ödeme
                      DataRow(
                        cells: [
                          const DataCell(Text('Su Faturası')),
                          DataCell(
                            Container(
                              color: Colors.red, // Ödenmemişse kırmızı
                              padding: const EdgeInsets.all(8.0),
                              child: const Text('100 TL'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showPaymentDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Ödeme Yap',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFF1F1F1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Color(0xFF303030), size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/user_home');
              },
            ),
            IconButton(
              icon:
              const Icon(Icons.payment, color: Color(0xFF303030), size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/user_payment');
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Color(0xFF303030), size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/user_profile');
              },
            ),
          ],
        ),
      ),
>>>>>>> 97498f8 (VersionUpdateEx)
    );
  }
}
