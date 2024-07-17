import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:pdf_report/preview.dart';
import 'package:printing/printing.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'preview_document.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: SizedBox(
            height: 100,
            width: 200,
            child: GestureDetector(
              onTap: () async {
                Uint8List pdfData = await buildPdf();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewDocument(pdfData: pdfData),
                  ),
                );
              },
              child: Container(
                color: Color.fromARGB(255, 30, 196, 99),
                alignment: Alignment.center,
                child: const Text(
                  "Generate Report Card",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Uint8List> buildPdf() async {
    print("Generating PDF");
    final pdf = pw.Document();
   
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('REPUBLIC OF CAMEROON', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('MINISTRY OF SECONDARY EDUCATION', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('DELEGATION REGIONALE DU NORD-OUEST', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('DELEGATION DEPARTEMENTALE DU MEZAM', style: pw.TextStyle(fontSize: 10)),
                    ],
                  ),
        
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('REPUBLIQUE DU CAMEROUN', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('MINISTERE DES ENSEIGNEMENTS SECONDAIRES', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('DELEGATION REGIONALE DU NORD-OUEST', style: pw.TextStyle(fontSize: 10)),
                      pw.Text('DELEGATION DEPARTEMENTALE DU MEZAM', style: pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Center(
                child: pw.Text(
                  'ST STEPHEN\'S INTERNATIONAL COLLEGE',
                  style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Center(
                child: pw.Text(
                  'Excellence in Education',
                  style: pw.TextStyle(fontSize: 12, fontStyle: pw.FontStyle.italic),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Center(
                child: pw.Text(
                  'REPORT CARD',
                  style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Center(
                child: pw.Text(
                  'Academic Year: 2023-2024 | Evaluation N° 5',
                  style: pw.TextStyle(fontSize: 12),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Name: Kenfuy Wendy', style: pw.TextStyle(fontSize: 12)),
                  pw.Text('Class: Form 2 Mid North', style: pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Place of Birth: Bamenda', style: pw.TextStyle(fontSize: 12)),
                  pw.Text('Date of Birth: 03/04/2009', style: pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Class Rank: 1st', style: pw.TextStyle(fontSize: 12)),
                  pw.Text('Enrolled: 35', style: pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'LANGUAGES AND LITERATURE',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Table.fromTextArray(
                headers: ['Subjects', 'Mark', 'Coef', 'Mark*Coef', 'Rank', 'Remarks'],
                data: [
                  ['English Language', '17.00', '6', '102.00', '1st', 'Excellent'],
                  ['French Language', '15.00', '6', '90.00', '2nd', 'Very Good'],
                ],
              ),
              pw.Text(
                'HUMAN AND SOCIAL SCIENCES',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Table.fromTextArray(
                headers: ['Subjects', 'Mark', 'Coef', 'Mark*Coef', 'Rank', 'Remarks'],
                data: [
                  ['Citizenship Education', '15.00', '4', '60.00', '1st', 'Very Good'],
                  ['Geography', '12.00', '6', '72.00', '5th', 'Average'],
                  ['History', '14.00', '6', '84.00', '3rd', 'Good'],
                ],
              ),
              pw.Text(
                'SCIENCE AND TECHNOLOGY',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Table.fromTextArray(
                headers: ['Subjects', 'Mark', 'Coef', 'Mark*Coef', 'Rank', 'Remarks'],
                data: [
                  ['Mathematics', '16.00', '8', '128.00', '1st', 'Excellent'],
                  ['Physics', '14.00', '7', '98.00', '3rd', 'Good'],
                  ['Chemistry', '13.00', '7', '91.00', '4th', 'Good'],
                  ['Biology', '15.00', '7', '105.00', '2nd', 'Very Good'],
                ],
              ),
              pw.Text(
                'OTHERS',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Table.fromTextArray(
                headers: ['Subjects', 'Mark', 'Coef', 'Mark*Coef', 'Rank', 'Remarks'],
                data: [
                  ['Physical Education', '18.00', '5', '90.00', '1st', 'Excellent'],
                  ['Music', '14.00', '4', '56.00', '2nd', 'Good'],
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Overall Performance',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Kenfuy Wendy\'s overall performance this term has been impressive, with a total mark of 800/1000 and an average of 80%.',
                textAlign: pw.TextAlign.justify,
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Teacher Comments',
                style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Kenfuy Wendy has shown excellent performance in most subjects, especially in Mathematics and Physical Education. He needs to improve in Geography. Overall, a very good performance.',
                textAlign: pw.TextAlign.justify,
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Class Master: Mr. Vuchas Elvis', style: pw.TextStyle(fontSize: 12)),
                  pw.Text('Principal: Dr. Johnson', style: pw.TextStyle(fontSize: 12)),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text('Date: June 19, 2024', style: pw.TextStyle(fontSize: 12)),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<pw.ImageProvider> networkImage(String url) async {
    final response = await NetworkAssetBundle(Uri.parse(url)).load(url);
    final bytes = response.buffer.asUint8List();
    return pw.MemoryImage(bytes);
  }
}
