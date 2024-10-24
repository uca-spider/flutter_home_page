import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData;

  DashboardPage({required this.salesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Penjualan'),
      ),
      body: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('No Faktur')),
          DataColumn(label: Text('Tanggal Penjualan')),
          DataColumn(label: Text('Nama Customer')),
          DataColumn(label: Text('Jumlah Barang')),
          DataColumn(label: Text('Total Penjualan')),
        ],
        rows: salesData.map((sale) {
          return DataRow(cells: [
            DataCell(Text(sale['noFaktur'])),
            DataCell(Text(sale['tanggalPenjualan'])),
            DataCell(Text(sale['namaCustomer'])),
            DataCell(Text(sale['jumlahBarang'].toString())),
            DataCell(Text(sale['totalPenjualan'])),
          ]);
        }).toList(),
      ),
    );
  }
}
