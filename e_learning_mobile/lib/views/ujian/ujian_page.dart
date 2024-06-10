import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UjianPage extends StatefulWidget {
  const UjianPage({Key? key}) : super(key: key);

  @override
  _UjianPageState createState() => _UjianPageState();
}

class _UjianPageState extends State<UjianPage> {
  late List<dynamic> _ujianData = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchUjianData();
  }

  Future<void> _fetchUjianData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.example.com/ujian'));
      if (response.statusCode == 200) {
        setState(() {
          _ujianData = jsonDecode(response.body) as List<dynamic>;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load ujian data');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Gagal memuat data ujian. Silakan coba lagi nanti.';
        if (error.toString().contains('Connection refused')) {
          _errorMessage = 'Koneksi ditolak. Pastikan server sedang berjalan.';
        }
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Schedule'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              : _ujianData.isEmpty
                  ? const Center(
                      child: Text(
                        'Tidak ada data ujian yang ditemukan.',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _ujianData.length,
                      itemBuilder: (context, index) {
                        final ujian = _ujianData[index];
                        return ListTile(
                          title: Text(ujian['title'] ?? ''),
                          subtitle: Text(ujian['description'] ?? ''),
                        );
                      },
                    ),
    );
  }
}
