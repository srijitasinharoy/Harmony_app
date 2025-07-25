import 'package:flutter/material.dart';

class KnowYourRightsScreen extends StatelessWidget {
  // List of legal topics
  final List<Map<String, String>> rightsTopics = [
    {
      "label": "Domestic violence",
      "description": """Laws and rights for protection against domestic abuse.
      \nConstitutional Provisions:
\u2605 Article 39(d) (Directive Principles of State Policy):
This article mandates that the State shall direct its policy towards securing "that there is equal pay for equal work for both men and women."
It's important to note that Directive Principles are not directly enforceable in courts, but they guide the State in making laws.   
\u2605 Articles 14, 15, and 16 (Fundamental Rights):
These articles reinforce the principle of equality:
\u2605 Article 14: Equality before the law.
\u2605 Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex, or place of birth.
\u2605 Article 16: Equality of opportunity in matters of public employment.
""",
    },
    {
      "label": "Workplace Violence",
      "description": """Your rights against workplace harassment and violence.
      \nConstitutional Foundations:
\u2605 Article 14: Equality before the law:
Guarantees equal protection and equality before the law. This is fundamental in ensuring all individuals are protected from workplace violence and harassment.
\u2605 Article 19(1)(g): Right to practice any profession, or to carry on any occupation, trade or business:
This right implies a safe working environment, free from violence and harassment, to effectively exercise one's profession.
\u2605 Article 21: Protection of life and personal liberty:
The Supreme Court's interpretation of this article includes the right to a dignified life. Workplace violence and harassment severely infringe upon this right.""",
    },
    {
      "label": "Abortion & Reproductive rights",
      "description": """Legal rights regarding abortion and reproductive health.
      \nConstitutional Foundations:
\u2605 Article 21: Right to life and personal liberty:
The Supreme Court has interpreted this article to include the right to live with dignity, which encompasses reproductive autonomy.
This interpretation forms the basis for recognizing a woman's right to make reproductive choices.
The Supreme court has made it clear that reproductive rights are included in the right to personal liberty.
\u2605 Article 14: Equality before the law:
This principle ensures that women have equal rights to make decisions about their bodies and reproductive health.""",
    },
    {
      "label": "Verbal abuse",
      "description": """Laws against verbal abuse and harassment.
      \nConstitutional Foundations:
\u2605 Article 19(1)(a): Freedom of speech and expression:
While this guarantees freedom of speech, it is subject to "reasonable restrictions." This means that speech that incites violence, hatred, or defamation is not protected. Conversely this article also protects a person's right to speak, and have freedom of expression.
\u2605 Article 21: Protection of life and personal liberty:
The Supreme Court has expanded this to include the right to live with dignity. Severe verbal abuse can violate this right.""",
    },
    {
      "label": "Cyber harassment",
      "description": """Protection against online abuse and cybercrimes.
      \nConstitutional Connections:
\u2605 Article 19(1)(a): Freedom of speech and expression:
While guaranteeing freedom of speech, this article also implies that such freedom is subject to "reasonable restrictions." Cyber harassment, which often involves abusive or threatening language, falls outside these protected boundaries.
\u2605 Article 21: Protection of life and personal liberty:
The Supreme Court's interpretation of this article includes the right to a dignified life. Cyber harassment can severely impact an individual's mental and emotional well-being, thus violating this right.""",
    },
    {
      "label": "Mental health",
      "description": """Know your mental health rights and access to support.
      \nConstitutional Foundations:
\u2605Article 21: Protection of life and personal liberty:
The Supreme Court's interpretation of this article emphasizes the right to live with dignity. This includes the right to mental well-being, as mental health is integral to a dignified life.
\u2605 Article 14: Equality before the law:
This ensures that individuals with mental illness have the same rights and protections as those with physical illnesses.""",
    },
    {
      "label": "Dowry",
      "description": """Understanding dowry laws and legal protection.
      Constitutional Provisions
\u2605 Article 14: Ensures equality before the law and equal protection under the law.
\u2605 Article 15(3): Allows the state to make special provisions for women and children to protect them from social evils like dowry.
\u2605 Article 39(a): Directs the state to ensure that men and women have equal rights to an adequate means of livelihood.
\u2605 Article 51A(e): Imposes a fundamental duty on citizens to renounce practices derogatory to the dignity of women, including dowry.""",
    },
    {
      "label": "Equal pay",
      "description": """Learn about equal pay rights and gender wage gaps.
      \nConstitutional Foundations:
\u2605 Article 14: Equality before the law:
Guarantees equality to all persons before the law and equal protection of the laws within the territory of India. This principle is fundamental to the concept of equal pay.
\u2605 Article 15(1): Prohibition of discrimination on grounds of religion, race, caste, sex or place of birth:
Specifically prohibits discrimination based on sex, which directly supports the principle of equal pay for equal work.
\u2605 Article 39(d): Directive Principles of State Policy:
Directs the State to ensure "that there is equal pay for equal work for both men and women." While Directive Principles are not directly enforceable in courts, they guide the State's policy-making and legislation.""",
    },
    {
      "label": "Female infanticide & foeticide laws",
      "description":
          """Laws preventing female infanticide and gender-based abortion.
      \nConstitutional Foundations:
\u2605 Article 14: Equality before the law:
This article ensures that all individuals, regardless of sex, are entitled to equal protection under the law. This is fundamental to preventing discrimination against female children.
\u2605 Article 15(1): Prohibition of discrimination on grounds of religion, race, caste, sex or place of birth:
This article explicitly prohibits discrimination based on sex, which directly combats the root cause of female foeticide and infanticide.
\u2605 Article 21: Protection of life and personal liberty:
This article, as interpreted by the Supreme Court, includes the right to life with dignity. Female foeticide and infanticide are a direct violation of this fundamental right.""",
    },
    {
      "label": "Transgender rights",
      "description":
          """Legal rights and protections for transgender individuals.
      \nConstitutional Foundations:
\u2605 Article 14: Equality before the law:
Guarantees equality to all persons, ensuring that transgender individuals have the same legal rights as everyone else.
\u2605 Article 15: Prohibition of discrimination:
Prohibits discrimination on grounds of sex, which, in its broader interpretation, includes gender identity.
\u2605 Article 21: Protection of life and personal liberty:
The Supreme Court has interpreted this to include the right to live with dignity, which encompasses the right to gender identity and expression.""",
    },
    {
      "label": "Right to maintenance",
      "description": """Rights related to financial support and maintenance.
      \nConstitutional Connections:
While the Indian Constitution doesn't explicitly state "right to maintenance," it provides the foundational principles:
\u2605 Article 14 (Equality before the law): Ensures that all individuals are treated equally under the law, which is crucial for ensuring that those entitled to maintenance receive it.
\u2605 Article 15(3) (Special provisions for women and children): Allows the state to make special provisions for women and children, recognizing their potential vulnerability. This enables the creation of maintenance laws.
\u2605 Article 39 (Directive Principles of State Policy): Directs the state to ensure that citizens, men and women equally, have the right to an adequate means of livelihood. This principle underpins the concept of maintenance.""",
    },
  ];

  KnowYourRightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Know Your Rights",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Image
              SizedBox(
                height: 200,
                child: Image.asset(
                  "law.png", // Replace with actual asset image
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              // Buttons Grid
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: rightsTopics.map((topic) {
                  return ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(topic["label"]!),
                            content: SingleChildScrollView(
                              child: Text(topic["description"]!),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[100],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (topic["icon"] != null)
                          Image.asset(
                            topic["icon"]!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        Text(
                          topic["label"]!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}