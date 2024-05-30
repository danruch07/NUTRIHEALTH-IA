import 'package:flutter/material.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final PageController _pageController = PageController();
  final Map<int, dynamic> _answers = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> questions = [
    {
      'question': '¿Cuál es tu género?',
      'options': ['Hombre', 'Mujer'],
      'values': [.1, .2],
    },
    {
      'question': '¿Cuántos años tienes?',
      'options': [
        'Menos de 18 años',
        '18 a 30 años',
        '31 a 40 años',
        '41 a 50 años',
        '51 a 60 años',
        'Más de 60 años'
      ],
      'values': [.1, .2, .3, .4, .5, .6],
    },
    {
      'question': '¿Con qué frecuencia consumes frutas?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes verduras?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes carnes rojas?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'
      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes pescado?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes pollo?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes huevo?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes embutidos?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes lácteos?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.3, .2, .1, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes frituras?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.5, .3, .2, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes refrescos?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'


      ],
      'values': [.5, .3, .2, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes comida procesada?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.5, .3, .2, .1,.0],
    },
    {
      'question': '¿Con qué frecuencia consumes grasas vegetales?',
      'options': [
        'Más de 3 porciones al día',
        '1 a 3 porciones al día',
        '1 a 3 porciones a la semana',
        '1 porción a la semana',
        'No consumo'

      ],
      'values': [.4, .3, .2, .1,.0],
    },
    {
      'question': '¿Tomas?',
      'options': [
        'Diario',
        '2 veces a la semana',
        '2 veces al mes',
        'No'

      ],
      'values': [.5, .3, .1, .0],
    },
    {
      'question': '¿Realizas actividad física?',
      'options': [
        '1 a 3 horas por semana',
        '3 a 5 horas por semana',
        '5 a 10 horas por semana',
        'Más de 10 horas por semana',
        'No'
      ],
      'values': [.3, .2, .1, .0,.5],
    },
    {
      'question': '¿Alguno de tus familiares tiene las siguientes enfermedades?',
      'options': [
        'Sobrepeso',
        'Obesidad',
        'Diabetes',
        'Hipertensión Arterial',
        'Hipercolesterolemia',
        'Síndrome metabólico',
        'Hígado graso',
        'Enfermedad cardiovascular',
        'No'

      ],
      'values': [.3, .3, .5, .5, .4, 0.5 ,0.2 ,0.3 ,0],
    },
    {
      'question': '¿Presentas alguno de los siguientes síntomas?',
      'options': [
        'Sed',
        'Orina en exceso',
        'Hambre excesiva',
        'Cansancio',
        'Dolor de cabeza',
        'Dolor de pecho',
        'Mareos',
        'No'

      ],
      'values': [.2, .2, .3, .4, .4, .5,.4,.0],
    },
  ];

  void _nextPage() {
    if (_answers[_pageController.page!.toInt()] == null) {
      _showAlertDialog('Por favor, selecciona una opción antes de continuar.');
    } else {
      if (_pageController.page!.toInt() < questions.length - 1) {
        _pageController.nextPage(
            duration: Duration(milliseconds: 900), curve: Curves.linearToEaseOut);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(answers: _answers, questions: questions),
          ),
        );
      }
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Precaución'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(
                  color: Colors.green
              ),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluación Medica', style: TextStyle(
            color: Colors.green
        ),),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: questions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions[index]['question'],
                  style: TextStyle(fontSize: 30),
                ),
                ...List<Widget>.from(questions[index]['options']
                    .asMap()
                    .entries
                    .map((option) => RadioListTile(
                  title: Text(option.value),
                  value: option.key,
                  groupValue: _answers[index],
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _answers[index] = value;
                    });
                  },
                ))),
                Spacer(),
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(index < questions.length - 1 ? 'Siguiente' : 'Analizar', style: TextStyle(
                      color: Colors.green
                  ),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ResultsScreen extends StatelessWidget {
  final Map<int, dynamic> answers;
  final List<Map<String, dynamic>> questions;

  ResultsScreen({required this.answers, required this.questions});

  @override
  Widget build(BuildContext context) {
    FuzzyLogic fuzzyLogic = FuzzyLogic(answers: answers, questions: questions);
    Map<String, double> probabilities = fuzzyLogic.analyze();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultados',
          style: TextStyle(color: Colors.green, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: probabilities.keys.map((disease) {
                return ListTile(
                  title: Text(disease),
                  trailing: Text(
                      (probabilities[disease]! * 100).toStringAsFixed(2) + '%'),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "La información de los resultados de NUTRIHEALTH no debe interpretarse "
              "como asesoramiento profesional o recomendaciones médicas.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Regresar",style: TextStyle(
                  color: Colors.green
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FuzzyLogic {
  final Map<int, dynamic> answers;
  final List<Map<String, dynamic>> questions;

  FuzzyLogic({required this.answers, required this.questions});

  Map<String, double> analyze() {
    Map<String, double> diseaseThresholds = {
      'Sobrepeso': 1.0,
      'Obesidad': .6,
      'Diabetes': 0.8,
      'Hipertensión Arterial': 0.5,
      'Hipercolesterolemia': 1.0,
      'Triglicéridos Altos': 0.6,
      'Síndrome Metabólico': 1.0,
      'Hígado Graso': 0.8,
      'Enfermedad Cardiovascular': 0.5,
      'Sano':  0.5,
    };
    Scaffold(

    );

    // Calcula el promedio de las respuestas
    double sum = 0.0;
    answers.forEach((index, value) {
      sum += questions[index]['values'][value];
    });
    double average = sum / answers.length;

    // Compara el promedio con los valores de referencia y calcula las probabilidades
    Map<String, double> probabilities = {};
    diseaseThresholds.forEach((disease, threshold) {
      double probability = (average / threshold).clamp(0.0, 1.0);
      probabilities[disease] = probability;
    });

    return probabilities;
  }
}

void main() {
  runApp(MaterialApp(
    home: QuestionnaireScreen(),
  ));
}
