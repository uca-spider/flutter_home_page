import 'package:flutter/material.dart';

class UpdateSalesPage extends StatefulWidget {
  final Function(int, Map<String, dynamic>) updateSales;
  final List<Map<String, dynamic>> salesData;

  UpdateSalesPage({required this.updateSales, required this.salesData});

  @override
  _UpdateSalesPageState createState() => _UpdateSalesPageState();
}

class _UpdateSalesPageState extends State<UpdateSalesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController noFakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController namaCustomerController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController totalPenjualanController = TextEditingController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentData = widget.salesData[selectedIndex];
    
    noFakturController.text = currentData['noFaktur'];
    tanggalController.text = currentData['tanggalPenjualan'];
    namaCustomerController.text = currentData['namaCustomer'];
    jumlahBarangController.text = currentData['jumlahBarang'].toString();
    totalPenjualanController.text = currentData['totalPenjualan'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Sales Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButton<int>(
                value: selectedIndex,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedIndex = newValue!;
                  });
                },
                items: List.generate(
                  widget.salesData.length,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Text(widget.salesData[index]['noFaktur']),
                  ),
                ),
              ),
              TextFormField(
                controller: noFakturController,
                decoration: InputDecoration(labelText: 'No Faktur'),
              ),
              TextFormField(
                controller: tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal Penjualan'),
              ),
              TextFormField(
                controller: namaCustomerController,
                decoration: InputDecoration(labelText: 'Nama Customer'),
              ),
              TextFormField(
                controller: jumlahBarangController,
                decoration: InputDecoration(labelText: 'Jumlah Barang'),
              ),
              TextFormField(
                controller: totalPenjualanController,
                decoration: InputDecoration(labelText: 'Total Penjualan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> updatedData = {
                      'noFaktur': noFakturController.text,
                      'tanggalPenjualan': tanggalController.text,
                      'namaCustomer': namaCustomerController.text,
                      'jumlahBarang': int.parse(jumlahBarangController.text),
                      'totalPenjualan': totalPenjualanController.text,
                    };
                    widget.updateSales(selectedIndex, updatedData);
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
