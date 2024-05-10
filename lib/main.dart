import 'package:flutter/material.dart';
import 'package:mini_challenge4/halDetail.dart';

void main() {
  runApp(MaterialApp(
    home: ResponsivePage(),
  ));
}

class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Responsif'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Jika ukuran layar seperti pada ponsel
            return buildListView(context); 
          } else {
            // Jika ukuran layar seperti pada PC atau tablet
            return buildGridView(context); 
          }
        },
      ),
    );
  }
}

Widget buildListView(BuildContext context) { 
  return ListView(
    children: [
      buildListItem(context, 'Gado-gado','Jawa Timur','assets/1.jpg'), 
      Divider(thickness: 1),
      buildListItem(context, 'Tahu Tek', 'Jawa Timur', 'assets/2.jpg'), 
      Divider(thickness: 1),
      buildListItem(context, 'Nasi Padang', 'Sumatera Barat', 'assets/3.png'), 
      Divider(thickness: 1),
      buildListItem(context, 'Rawon', 'Jawa Timur', 'assets/4.jpg'), 
      Divider(thickness: 1),
      buildListItem(context, 'Mie Ayam', 'Jawa Tengah', 'assets/5.jpg'), 
      Divider(thickness: 1),
      buildListItem(context, 'Seblak', 'Jawa Barat', 'assets/6.png'), 
      Divider(thickness: 1),
    ],
  );
}

Widget buildGridView(BuildContext context) { 
  return LayoutBuilder(
    builder: (context, constraints) {
      int crossAxisCount;
      if (constraints.maxWidth > 900) {
        // Lebih dari 900 px (ukuran layar PC)
        crossAxisCount = 6;
      } else if (constraints.maxWidth > 600) {
        // Antara 600 dan 900 px (ukuran layar tablet)
        crossAxisCount = 4;
      } else {
        // Kurang dari 600 px (ukuran layar ponsel)
        crossAxisCount = 2;
      }
      return GridView.count(
        crossAxisCount: crossAxisCount,
        children: [
          buildGridItem(context, 'assets/1.jpg','Gado-gado','Jawa Timur'), 
          buildGridItem(context, 'assets/2.jpg','Tahu Tek', 'Jawa Timur'), 
          buildGridItem(context, 'assets/3.png','Nasi Padang', 'Sumatera Barat'), 
          buildGridItem(context, 'assets/4.jpg','Rawon', 'Jawa Timur'), 
          buildGridItem(context, 'assets/5.jpg','Mie Ayam', 'Jawa Tengah'), 
          buildGridItem(context, 'assets/6.png','Seblak', 'Jawa Barat'), 
          // Tambahkan item sesuai kebutuhan
        ],
      );
    },
  );
}

Widget buildListItem(BuildContext context, String judul, String deskripsi, String foto) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HalDetail(judul: judul, deskripsi: deskripsi, foto: foto)),
      );
    },
    child: ListTile(
      leading: Image.asset(foto), // Menambahkan gambar di bagian leading
      title: Text(judul),
      subtitle: Text(deskripsi),
    ),
  );
}

Widget buildGridItem(BuildContext context, String foto, String judul, String deskripsi) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HalDetail(judul: judul, deskripsi: deskripsi, foto: foto)),
      );
    },
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(foto), // Menambahkan gambar di dalam Card
          SizedBox(height: 5),
          Text(
            judul,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(deskripsi),
        ],
      ),
    ),
  );
}
