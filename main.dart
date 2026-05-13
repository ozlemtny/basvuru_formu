import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasvuruFormu(),
    );
  }
}

class BasvuruFormu extends StatefulWidget {
  @override
  _BasvuruFormuState createState() => _BasvuruFormuState();
}

class _BasvuruFormuState extends State<BasvuruFormu> {

  String cinsiyet = "Erkek";
  bool robotDegilim = false;

  TextEditingController ad = TextEditingController();
  TextEditingController soyad = TextEditingController();
  TextEditingController yas = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İş Başvuru Formu"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade100,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),

          child: Column(
            children: [

              // AD
              TextField(
                controller: ad,
                decoration: InputDecoration(
                  labelText: "Ad",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 15),

              // SOYAD
              TextField(
                controller: soyad,
                decoration: InputDecoration(
                  labelText: "Soyad",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 15),

              // CİNSİYET
              DropdownButtonFormField(
                value: cinsiyet,
                items: [
                  DropdownMenuItem(
                    child: Text("Erkek"),
                    value: "Erkek",
                  ),
                  DropdownMenuItem(
                    child: Text("Kadın"),
                    value: "Kadın",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    cinsiyet = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Cinsiyet",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 15),

              // YAŞ
              TextField(
                controller: yas,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Yaş",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 15),

              // E-POSTA
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "E-Posta",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 15),

              // TELEFON
              TextField(
                controller: telefon,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Telefon",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 15),

              // CV ALANI
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "CV Yükle (Dosya Alanı)",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 15),

              // BEN ROBOT DEĞİLİM
              CheckboxListTile(
                title: Text("Ben robot değilim"),
                value: robotDegilim,
                onChanged: (value) {
                  setState(() {
                    robotDegilim = value!;
                  });
                },
              ),

              SizedBox(height: 20),

              // BUTON
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Başarılı"),
                        content: Text("Başvurunuz gönderildi."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Tamam"),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: Text(
                  "Başvur",
                  style: TextStyle(fontSize: 18),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}