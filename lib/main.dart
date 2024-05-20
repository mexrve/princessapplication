// ignore_for_file: dead_code

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:princessapp/random_fact.dart';

import 'package:prencess_app/EgzersizTakvimi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prenses Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Merhaba prenses, bugün nasılsın?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[900]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 239, 147, 178)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoriesPage()),
                  );
                },
                child: Text('Mükemmelim, hadi başlayalım!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Kategoriler'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Güzellik Zikirmatiği'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeautyCounterPage()),
              );
            },
          ),
          ListTile(
            title: Text('Prenses Günlüğü'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrincessDiaryPage()),
              );
            },
          ),
          ListTile(
            title: Text('Prensesler için kokteyl rehberi!'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CocktailGuidePage()),
              );
            },
          ),
          ListTile(
            title: Text('Rastgele Bilgi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomFactPage()),
              );
            },
          ),
          ListTile(
            title: Text('Prensesler için egzersiz takvimi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EgzersizTakvimi()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// buradan itibaren GÜZELLİK SAYACI
class BeautyCounterPage extends StatefulWidget {
  @override
  _BeautyCounterPageState createState() => _BeautyCounterPageState();
}

class _BeautyCounterPageState extends State<BeautyCounterPage> {
  int beautyCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Güzellik Zikirmatiği'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bugün $beautyCount kere güzel olduğunu bana bildirdin!',
              style: TextStyle(fontSize: 20, color: Colors.pink[900]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                setState(() {
                  beautyCount++;
                });
              },
              child: Text('Tıkla!'),
            ),
            SizedBox(height: 20),
            Text(
              'Güzel ve bilge bir prenses olduğumu onaylıyorum!',
              style: TextStyle(fontSize: 18, color: Colors.pink[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PrincessDiaryPage extends StatefulWidget {
  @override
  _PrincessDiaryPageState createState() => _PrincessDiaryPageState();
}

class _PrincessDiaryPageState extends State<PrincessDiaryPage> {
  final List<Map<String, String>> notes = [];
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _addNote() {
    setState(() {
      notes.add({
        'title': _titleController.text,
        'content': _contentController.text,
      });
      _titleController.clear();
      _contentController.clear();
    });
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

// buradan itibaren PRENSES GÜNLÜĞÜ
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Prenses Günlüğü'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Başlık',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Not',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: _addNote,
            child: Text('Not Ekle'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(notes[index]['title']!),
                    subtitle: Text(notes[index]['content']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.pink),
                      onPressed: () => _deleteNote(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//buradan itibaren KOKTEYL REHBERİ
class CocktailGuidePage extends StatelessWidget {
  final List<Map<String, dynamic>> drinks = [
    {
      "idDrink": "11007",
      "strDrink": "Margarita",
      "strCategory": "Sıradan İçki",
      "strAlcoholic": "Alkollü",
      "strGlass": "Kokteyl bardağı",
      "strInstructions":
          "Bardağın kenarına limon dilimi sürüp tuz yapışmasını sağlayın. Dış kenarını nemlendirin ve tuzu üzerine serpiştirin. Tuz, içen kişinin dudaklarına değmeli ve asla kokteyle karışmamalıdır. Diğer malzemeleri buz ile çalkalayın ve dikkatlice bardağa dökün.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
      "strIngredient1": "Tekila",
      "strIngredient2": "Triple sec",
      "strIngredient3": "Lime suyu",
      "strIngredient4": "Tuz",
      "strMeasure1": "1 1/2 oz",
      "strMeasure2": "1/2 oz",
      "strMeasure3": "1 oz"
    },
    {
      "idDrink": "11118",
      "strDrink": "Blue Margarita",
      "strCategory": "Sıradan İçki",
      "strAlcoholic": "Alkollü",
      "strGlass": "Kokteyl bardağı",
      "strInstructions":
          "Bardağın kenarına lime suyu sürün. Kenarını iri tuza batırın. Tekila, blue curacao ve lime suyunu buz ile çalkalayın, tuzla kaplanmış bardağa süzün ve servis yapın.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg",
      "strIngredient1": "Tekila",
      "strIngredient2": "Blue Curacao",
      "strIngredient3": "Lime suyu",
      "strIngredient4": "Tuz",
      "strMeasure1": "1 1/2 oz",
      "strMeasure2": "1 oz",
      "strMeasure3": "1 oz",
      "strMeasure4": "İri"
    },
    {
      "idDrink": "17216",
      "strDrink": "Tommy's Margarita",
      "strCategory": "Sıradan İçki",
      "strAlcoholic": "Alkollü",
      "strGlass": "Eski Moda Bardak",
      "strInstructions": "Çalkalayın ve soğutulmuş kokteyl bardağına süzün.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg",
      "strIngredient1": "Tekila",
      "strIngredient2": "Lime Suyu",
      "strIngredient3": "Agave şurubu",
      "strMeasure1": "4.5 cl",
      "strMeasure2": "1.5 cl",
      "strMeasure3": "2 kaşık"
    },
    {
      "idDrink": "16158",
      "strDrink": "Whitecap Margarita",
      "strCategory": "Diğer / Bilinmeyen",
      "strAlcoholic": "Alkollü",
      "strGlass": "Margarita/Kupet bardağı",
      "strInstructions":
          "Tüm malzemeleri blenderda karıştırın ve pürüzsüz hale gelene kadar karıştırın. Bu, bir içki yapar.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg",
      "strIngredient1": "Buz",
      "strIngredient2": "Tekila",
      "strIngredient3": "Hindistancevizi kreması",
      "strIngredient4": "Lime suyu",
      "strMeasure1": "1 fincan",
      "strMeasure2": "2 oz",
      "strMeasure3": "1/4 fincan",
      "strMeasure4": "3 yemek kaşığı taze"
    },
    {
      "idDrink": "12322",
      "strDrink": "Strawberry Margarita",
      "strCategory": "Sıradan İçki",
      "strAlcoholic": "Alkollü",
      "strGlass": "Kokteyl bardağı",
      "strInstructions":
          "Kokteyl bardağının kenarına limon suyu sürün ve tuza batırın. Şnaps, tekila, triple sec, limon suyu ve çilekleri buz ile çalkalayın, tuzlu bardağa süzün ve servis yapın.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/tqyrpw1439905311.jpg",
      "strIngredient1": "Çilek şnapsı",
      "strIngredient2": "Tekila",
      "strIngredient3": "Triple sec",
      "strIngredient4": "Limon suyu",
      "strIngredient5": "Çilek",
      "strIngredient6": "Tuz",
      "strMeasure1": "1/2 oz",
      "strMeasure2": "1 oz",
      "strMeasure3": "1/2 oz",
      "strMeasure4": "1 oz",
      "strMeasure5": "1 oz"
    },
    {
      "idDrink": "178332",
      "strDrink": "Smashed Watermelon Margarita",
      "strCategory": "Kokteyl",
      "strAlcoholic": "Alkollü",
      "strGlass": "Collins bardağı",
      "strInstructions":
          "Bir mason kavanozda karpuz ve 5 nane yaprağını püre haline getirin ve süzün. Daha sonra greyfurt suyu, yarım lime suyu ve tekilayı buz ile ekleyin. Kavanoza kapak koyup çalkalayın. Bardağa dökün ve daha fazla buz ekleyin. Taze nane ve küçük bir dilim karpuz ile süsleyin.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/dztcv51598717861.jpg",
      "strIngredient1": "Karpuz",
      "strIngredient2": "Nane",
      "strIngredient3": "Greyfurt Suyu",
      "strIngredient4": "Lime",
      "strIngredient5": "Tekila",
      "strIngredient6": "Karpuz",
      "strIngredient7": "Nane",
      "strMeasure1": "1/2 fincan",
      "strMeasure2": "5 yaprak",
      "strMeasure3": "1/3 Fincan",
      "strMeasure4": "Yarımının suyu",
      "strMeasure5": "1 shot",
      "strMeasure6": "Süslemek için",
      "strMeasure7": "Süslemek için"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prensesler için kokteyl rehberi!'),
      ),
      body: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return ListTile(
            leading: Image.network(drink['strDrinkThumb']),
            title: Text(drink['strDrink']),
            subtitle: Text(drink['strCategory']),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(drink['strDrink']),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Kategori: ${drink['strCategory']}'),
                        Text('Bardak: ${drink['strGlass']}'),
                        Text('Alkol Durumu: ${drink['strAlcoholic']}'),
                        SizedBox(height: 10),
                        Text('Malzemeler:'),
                        buildIngredientText(
                            drink['strMeasure1'], drink['strIngredient1']),
                        buildIngredientText(
                            drink['strMeasure2'], drink['strIngredient2']),
                        buildIngredientText(
                            drink['strMeasure3'], drink['strIngredient3']),
                        buildIngredientText(
                            drink['strMeasure4'], drink['strIngredient4']),
                        buildIngredientText(
                            drink['strMeasure5'], drink['strIngredient5']),
                        buildIngredientText(
                            drink['strMeasure6'], drink['strIngredient6']),
                        buildIngredientText(
                            drink['strMeasure7'],
                            drink[
                                'strIngredient7']), // Ekledim, çünkü bazı içeceklerde 7 malzeme var
                        SizedBox(height: 10),
                        Text('Talimatlar:'),
                        Text(drink['strInstructions']),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Kapat'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget buildIngredientText(String? measure, String? ingredient) {
    if (measure != null &&
        ingredient != null &&
        measure.trim().isNotEmpty &&
        ingredient.trim().isNotEmpty) {
      return Text('$measure $ingredient');
    }
    return SizedBox.shrink(); // Boş malzemeleri göstermemek için
  }
}
