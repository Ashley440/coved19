import 'package:carousel_pro/carousel_pro.dart';
import 'package:coved19/models/lesson.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<Lesson> lessons = [
    Lesson(
        imageLink: "assets/images/wash_hands.jpg",
        question: "Wash your hands",
        answer:
            "Wash hands with soap and water for at least 20 seconds or use a hand sanitizer with at least 60% alcohol. Dry them thoroughly with an air dryer or clean towel."),
    Lesson(
      imageLink: "assets/images/no_touch.jpg",
      question: "Avoid touching face",
      answer: "Avoid touching nose, eyes, and mouth. Use a tissue to cover a cough or sneeze, then dispose of it in the trash."
    ),
    Lesson(
      imageLink: "assets/images/wear_mask.jpg",
      question: "Wear a mask",
      answer: "Wearing a mask prevents you from spreading the virus and it prevents you from getting it."
    ),
    Lesson(
      imageLink: "assets/images/cover_up.jpg",
      question: "Use elbow",
      answer: "Using the bend of your elbow when coughing / sneezing prevents the germs from getting onto your hands and in turn from surfaces."
    )
  ];

  // List<Lesson> lessons = [
  //   Lesson(
  //       question: "What is covid19?",
  //       answer: [
  //         "Coronavirus disease 2019 is an infectious disease caused by severe acute respiratory syndrome coronavirus 2"
  //       ],
  //       source: "Unknown"),
  //   Lesson(
  //       question: "What precautions should I take against covid19?",
  //       answer: [
  //         "The Centers for Disease Control and Prevention (CDC) recommends the following preventive actions:",
  //         "Wash hands with soap and water for at least 20 seconds. Dry them thoroughly with an air dryer or clean towel. If soap isn’t available, use a hand sanitizer with at least 60% alcohol.",
  //         "Stay home if you are sick.",
  //         "Avoid touching nose, eyes, and mouth. Use a tissue to cover a cough or sneeze, then dispose of it in the trash.",
  //         "Use a household wipe or spray to disinfect doorknobs, light switches, desks, keyboards, sinks, toilets, cell phones, and other objects and surfaces that are frequently touched.",
  //         "If you are going out in public, bring a cloth face covering to wear over the nose and mouth, tissues, and a hand sanitizer with at least 60% alcohol, if possible. Avoid people who are not wearing cloth face coverings. Always wear a face mask in public settings where other social distancing measures are difficult to maintain, especially in areas where there is significant community-based transmission.",
  //         "In addition, the CDC is urging everyone to get the flu vaccine. The flu vaccine is especially important this year, since Covid-19 and flu can have similar symptoms, which can complicate diagnosis, and both can result in severe illness and complications."
  //       ],
  //       source:
  //           "Yale Medicine | 5 Things everyone should know about the Coronavirus Outbreak"),
  //   Lesson(
  //       question: "COVID-19 is changing rapidly",
  //       answer: [
  //         "The number of people infected by the disease continues to change every day. While the impact of the disease varies by location, there are now more than 37.4 million confirmed cases of people with COVID-19 around the globe and more than 1 million people have died from the disease, according to the WHO. (While some news sources report different numbers, the WHO provides official counts of confirmed cases once a day.)",
  //         "The Centers for Disease Control and Prevention (CDC) provides a rough picture of the outbreak in the U.S. here, currently putting the total confirmed and probable cases at more than 7.7 million, and estimating more than 214,000 deaths. (If there are any discrepancies, data provided by state public health departments should be considered the most up to date, according to the agency).",
  //         "The term coronavirus includes a family of seven known viruses that cause respiratory tract illnesses that range from the common cold to such potentially deadly illnesses as severe acute respiratory syndrome (SARS), which killed almost 800 people during an epidemic that occurred in 2002 and 2003.",
  //         "According to the CDC, reported COVID-19 illnesses have ranged from mild (with no reported symptoms in some cases) to severe to the point of requiring hospitalization, intensive care, and/or a ventilator. And, in some cases, COVID-19 illnesses can lead to death. The risk for severe illness increases with age (so people in their 50s are at higher risk for severe illness than those in their 40s, and those in their 60s and 70s are at higher risk, generally, than those in their 50s. People ages 85 and older are at the greatest risk. People living in a nursing home or long-term care facility, and people of all ages with underlying health conditions (such as diabetes, heart disease, lung disease, and obesity) also are at high risk for serious illness.",
  //         "Knowledge about the virus is evolving. A letter to the editor published in The New England Journal of Medicine in mid-March showed the virus that causes COVID-19 may be stable for several hours in aerosols (in this case, droplets from an infected person dispersed in air or gas) and for several hours to days on surfaces. Scientists who participated in the analysis found SARS-CoV-2 was detectable in aerosols for up to three hours, copper up to four hours, cardboard up to 24 hours, and plastic and stainless steel up to two to three days.",
  //         "In July, 239 scientists in 32 countries wrote an open letter to the WHO outlining evidence that tiny virus droplets people expel when they cough or sneeze can hang in stagnant air for hours, making crowded indoor spaces with poor ventilation risky. The WHO then issued a scientific brief that maintained, among other things, an earlier assertion that the virus is mostly spread through close contact with infected people, but it also called for further research into airborne aerosols and recommended avoiding crowded places, close contact settings, and confined and enclosed places with poor ventilation."
  //       ],
  //       source:
  //           "Yale Medicine | 5 Things everyone should know about the Coronavirus Outbreak"),
  //   Lesson(
  //       question: "Why should we take prevention measures against Covid19?",
  //       answer: [
  //         "Strict measures are critical for slowing the spread of the disease",
  //         "Public health efforts have been aimed at &quot;flattening the curve.&quot; If you map the number of COVID-19 cases over time, the expectation is that it will peak at some point—on a graph this peak would mirror a surge in patients (which could overwhelm hospitals and health care providers). Flattening the curve would mean there would be fewer patients during that period, and hospitals would be better able to manage the demands of patients who are sick with COVID-19 and other illnesses.",
  //         "Meanwhile, communities have been ramping up contact tracing efforts to locate and support people who have had a potentially high-risk exposure to someone infected with COVID-19.",
  //       ],
  //       source:
  //           "Yale Medicine | 5 Things everyone should know about the Coronavirus Outbreak"),
  //   Lesson(
  //       question: "Does COVID19 have a vaccine?",
  //       answer: [
  //         "Experts are working rapidly to find solutions",
  //         "In the U.S., widely available testing is important in understanding how the disease is transmitted and the true infection and mortality rates. While health providers across the country are using a variety of tests—and still learning about the most accurate approach—two kinds of tests are important to know about: viral tests help diagnose a current infection and antibody tests can tell if you’ve had a previous one (it is not yet known whether COVID-19 antibodies can protect from being infected again or how long protection might last). Health care providers and state and local health departments make determinations about who should be tested. ",
  //         "A number of existing medicines have been suggested as potential investigational therapies for COVID-19. In early May, the FDA issued its first emergency use authorization for a COVID-19 treatment for the investigational antiviral drug remdesivir, allowing use of the drug to treat suspected or laboratory-confirmed COVID-19 in adults and children hospitalized with severe disease. While there is still limited information about the safety and effectiveness of remdesivir when used for COVID-19, preliminary studies have shown that it may shorten recovery time in the hospital from 15 to 11 days. ",
  //         "More recently, the WHO issued new treatment guidelines to make corticosteroids (also known as steroids) a standard of care, but only for patients with “severe and critical” cases of COVID-19. The guidelines were made after analysis of seven clinical trials, published in the Journal of the American Medical Association, showed the drugs reduced the risk of death in hospitalized COVID-19 patients by a third. ",
  //       ],
  //       source:
  //           "Yale Medicine | 5 Things everyone should know about the Coronavirus Outbreak"),
  //   Lesson(
  //       question: "What are the symptoms of Covid 19?",
  //       answer: [
  //         "According to the Centers for Disease Control and Prevention (CDC), symptoms may include: ",
  //         "Fever or chills",
  //         "Cough",
  //         "Shortness of breath or difficulty breathing ",
  //         "Fatigue",
  //         "Muscle or body aches",
  //         "Headache",
  //         "New loss of taste or smell",
  //         "Sore throat",
  //         "Congestion or runny nose",
  //         "Nausea or vomiting",
  //         "Diarrhea",
  //         "This list does not include all possible symptoms. The CDC will continue to update its symptoms list as it learns more about COVID-19.",
  //       ],
  //       source:
  //           "Yale Medicine | 5 Things everyone should know about the Coronavirus Outbreak"),
  // ];
  @override
  Widget build(BuildContext context) {
    const double spacing = 25;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.white,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/covid.JPG", width: 150, height: 150,),
                    SizedBox(height: 25),
                    Text("What is COVID19?", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22)),
                    SizedBox(height: 5),
                    Text("Coronavirus disease 2019 is an infectious disease caused by severe acute respiratory syndrome coronavirus 2",
                    textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing),
            Text("Symptoms", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                height: 300,
                child: Carousel(
                  images: [for (int i=0 ; i < 4; i++) Image.asset("assets/images/$i.jpg")],
                  boxFit: BoxFit.cover,
                  showIndicator: false,
                )
              ),
            ),
            SizedBox(height: spacing),
            Text("Precautions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
            // SizedBox(height: 5),
            for (Lesson lesson in lessons) lesson.display(),
          ],
        ),
      ),
    );
  }
}
