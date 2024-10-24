import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'add_sales_page.dart';
import 'update_sales_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> salesData = [
    {
      'noFaktur': 'INV001',
      'tanggalPenjualan': '2024-10-20',
      'namaCustomer': 'John Doe',
      'jumlahBarang': 5,
      'totalPenjualan': 'Rp 1.000.000'
    },
    {
      'noFaktur': 'INV002',
      'tanggalPenjualan': '2024-10-21',
      'namaCustomer': 'Jane Smith',
      'jumlahBarang': 3,
      'totalPenjualan': 'Rp 750.000'
    },
    {
      'noFaktur': 'INV003',
      'tanggalPenjualan': '2024-10-22',
      'namaCustomer': 'Michael Lee',
      'jumlahBarang': 2,
      'totalPenjualan': 'Rp 500.000'
    },
  ];

  void addSales(Map<String, dynamic> newData) {
    setState(() {
      salesData.add(newData);
    });
  }

  void updateSales(int index, Map<String, dynamic> updatedData) {
    setState(() {
      salesData[index] = updatedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Label identitas
            Text(
              'Aplikasi Manajemen Penjualan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8), // Spasi antara label dan NPM
            Text(
              'Nama: Fulandi Hudza Grahitama',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'NPM: 714220010',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20), // Spasi antara identitas dan grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Jumlah kolom
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: <Widget>[
                  _buildSquareButton('Dashboard', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage(salesData: salesData)));
                  }),
                  _buildSquareButton('Add', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddSalesPage(addSales: addSales)));
                  }),
                  _buildSquareButton('Update', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateSalesPage(updateSales: updateSales, salesData: salesData)));
                  }),
                  _buildSquareButton('Logout', () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareButton(String title, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 1, // Membuat kontainer berbentuk persegi
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
