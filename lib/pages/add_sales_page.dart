import 'package:flutter/material.dart';

class AddSalesPage extends StatefulWidget {
  final Function(Map<String, dynamic>) addSales;

  AddSalesPage({required this.addSales});

  @override
  _AddSalesPageState createState() => _AddSalesPageState();
}

class _AddSalesPageState extends State<AddSalesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController noFakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController namaCustomerController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController totalPenjualanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sales Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                    Map<String, dynamic> newData = {
                      'noFaktur': noFakturController.text,
                      'tanggalPenjualan': tanggalController.text,
                      'namaCustomer': namaCustomerController.text,
                      'jumlahBarang': int.parse(jumlahBarangController.text),
                      'totalPenjualan': totalPenjualanController.text,
                    };
                    widget.addSales(newData);
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
