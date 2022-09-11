
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/services/storage.dart';
import "dart:io";
import 'package:universal_html/html.dart' as html ;


Future  pdfgenerate(double cost, String week ,int purchase,String rider, String company, String title) async {

  double dis = discountcalculator(int.parse(rider), int.parse(week), purchase);

  double disprice = discountprice(cost, dis);

  double price = cost * int.parse(rider) * int.parse(week);


  //User? user = FirebaseAuth.instance.currentUser;
  UploadTask? task;
  Uint8List? bill;
  ByteData img = ByteData(7);
  Uint8List img1= Uint8List(8);
  final pdf = pw.Document();
  img = await rootBundle.load("assets/Logo.png");
  img1 = img.buffer.asUint8List();
  final image = pw.MemoryImage(img1);

  pdf.addPage(
      pw.Page(
          build: (pw.Context context){
            return pw.Column(
             children: [
               pw.Image(image,
                 height: 100,
                 width: 100,
               ),
               pw.SizedBox(height: 50),

               pw.Center(
                 child: pw.Container(
                   padding: pw.EdgeInsets.all(30),
                   child: pw.Column(
                     children: [
                       pw.SizedBox(height: 20),
                       pw.Row(
                         children: [
                           pw.Text("Company : "),
                           pw.SizedBox(width: 20),
                           pw.Text(company,
                           style: pw.TextStyle(
                             fontWeight: pw.FontWeight.bold,
                             color: PdfColors.green
                           )
                           ),
                           pw.SizedBox(width: 30),
                           pw.Text("Campaign : "),
                           pw.SizedBox(width: 20),
                           pw.Text(title,
                               style: pw.TextStyle(
                                   fontWeight: pw.FontWeight.bold,
                                   color: PdfColors.green
                               )
                           ),
                         ]
                       ),
                       pw.SizedBox(height: 10),
                       pw.Divider(),
                       pw.SizedBox(height: 10),
                       pw.Center(
                         child: pw.Text(
                           "Invoice",
                             style: pw.TextStyle(
                                 fontWeight: pw.FontWeight.bold,
                                 color: PdfColors.green
                             )
                         )
                       ),
                       pw.SizedBox(height: 20),
                       pw.Row(
                           children: [
                             pw.Text("Riders",
                                 style: pw.TextStyle(
                                   fontWeight: pw.FontWeight.bold,
                                 )
                             ),
                             pw.SizedBox(width: 30),
                             pw.Text("Weeks",
                                 style: pw.TextStyle(
                                     fontWeight: pw.FontWeight.bold,
                                 )
                             ),
                             pw.SizedBox(width: 30),
                             pw.Text("City",
                                 style: pw.TextStyle(
                                   fontWeight: pw.FontWeight.bold,
                                 )
                             ),
                             pw.SizedBox(width: 30),
                             pw.Text("Cost",
                                 style: pw.TextStyle(
                                   fontWeight: pw.FontWeight.bold,
                                 )
                             ),
                             pw.SizedBox(width: 20),

                           ]
                       ),
                       pw.SizedBox(height: 30),
                       pw.Row(
                           children: [
                             pw.Text(rider,
                             ),
                             pw.SizedBox(width: 30),
                             pw.Text(week,

                             ),
                             pw.SizedBox(width: 30),
                             pw.Text("Stockholm",
                             ),
                             pw.SizedBox(width: 30),
                             pw.Text("$price",
                             ),
                             pw.SizedBox(width: 20),
                           ]
                       ),






                     ]
                   )
                 ),

                 ),
             ]
            );
          }
      ),


  );

bill = await pdf.save();



final blob =html.Blob([bill],'application/pdf');
final urll=html.Url.createObjectUrlFromBlob(blob);
final anchor = html.document.createElement('a') as html.AnchorElement
  ..href = urll
  ..style.display = 'none'
  ..download = 'bill.pdf';
   html.document.body?.children.add(anchor);

anchor.click();

}


Future pdfgenerate1(double cost, String week ,int purchase,String rider,String company,String title) async {

  User? user = FirebaseAuth.instance.currentUser;
  UploadTask? task;
  Uint8List? bill;
  ByteData img = ByteData(7);
  Uint8List img1= Uint8List(8);
  final pdf = pw.Document();
  img = await rootBundle.load("assets/Logo.png");
  img1 = img.buffer.asUint8List();
  final image = pw.MemoryImage(img1);

  pdf.addPage(
    pw.Page(
        build: (pw.Context context){
          return pw.Column(
              children: [
                pw.Center(child: pw.Image(image),),
                pw.SizedBox(height: 20),
                pw.Center(child: pw.Text("Invoice"),),
              ]
          );
        }
    ),


  );
final file1 = File("bill.pdf");
await file1.writeAsBytes(await pdf.save());

  String url;
  UploadTask? task1;

  //if (file1 == null) return;

  final fileName = "bill.pdf";
  final destination = 'invoice/${user!.uid}/$fileName';
  task1 = Firebaseapi.uploadFile(destination, file1);


  if (task1 == null) return;

  final snapshot = await task1.whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();

    url = urlDownload;
 return url;

}


discountprice(double price , double discount){
  double discountprice;

  discountprice= price * (discount/100);

  return discountprice;
}

 discountcalculator (var rider , var week , var purchase) {
  var discount;
  if(purchase==1){
    if(week==1){

      if(rider<15){
        discount = 5;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 6;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 7;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 8;
        return discount;
      }


    }
    if(week==2){
      if(rider<15){
        discount = 7;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 8;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 9;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 10;
        return discount;
      }
    }
    if(week==3){
      if(rider<15){
        discount = 8;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 9;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 10;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 11;
        return discount;
      }
    }
    if(week==4){
      if(rider<15){
        discount = 9;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 10;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 11;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 12;
        return discount;
      }
    }
    if(week==5){
      if(rider<15){
        discount = 10;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 11;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 12;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 13;
        return discount;
      }
    }
  }
  if(purchase==2 || purchase>=4){
    if(week==1){

      if(rider<15){
        discount = 7.5;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 8.5;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 9.5;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 10.5;
        return discount;
      }


    }
    if(week==2){
      if(rider<15){
        discount = 9.5;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 10.5;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 11.5;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 12.5;
        return discount;
      }
    }
    if(week==3){
      if(rider<15){
        discount = 10.5;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 11.5;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 12.5;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 13.5;
        return discount;
      }
    }
    if(week==4){
      if(rider<15){
        discount = 11.5;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 12.5;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 13.5;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 14.5;
        return discount;
      }
    }
    if(week==5){
      if(rider<15){
        discount = 12.5;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 13.5;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 14.5;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 15.5;
        return discount;
      }
    }
  }
  if(purchase==3){
    if(week==1){

      if(rider<15){
        discount = 10;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 11;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 12;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 13;
        return discount;
      }


    }
    if(week==2){
      if(rider<15){
        discount = 12;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 13;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 14;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 15;
        return discount;
      }
    }
    if(week==3){
      if(rider<15){
        discount = 13;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 14;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 15;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 16;
        return discount;
      }
    }
    if(week==4){
      if(rider<15){
        discount = 14;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 15;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 16;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 17;
        return discount;
      }
    }
    if(week==5){
      if(rider<15){
        discount = 15;
        return discount;
      }
      if(rider>=15 && rider<30){
        discount = 16;
        return discount;
      }
      if(rider>=30 && rider<45){
        discount = 17;
        return discount;
      }
      if(rider>=45 && rider<106){
        discount = 18;
        return discount;
      }
    }
  }
}