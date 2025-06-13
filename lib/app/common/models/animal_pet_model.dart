class AnimalPetModel {
  final List<AnimalPetResult> results;

  AnimalPetModel({required this.results});

  factory AnimalPetModel.fromJson(Map<String, dynamic> json) {
    return AnimalPetModel(
      results: (json['results'] as List)
          .map((e) => AnimalPetResult.fromJson(e))
          .toList(),
    );
  }
}

class AnimalPetResult {
  final String uniqueAERIdNumber;
  final String? originalReceiveDate;
  final String? treatedForAE;
  final List<Reaction>? reaction;
  final Receiver? receiver;
  final String? primaryReporter;
  final int? numberOfAnimalsAffected;
  final int? numberOfAnimalsTreated;
  final List<Drug>? drug;
  final DurationInfo? duration;
  final HealthAssessment? healthAssessment;
  final String? onsetDate;
  final String? reportId;
  final Animal? animal;
  final String? typeOfInformation;
  final String? seriousAE;
  final List<Outcome>? outcome;

  AnimalPetResult({
    required this.uniqueAERIdNumber,
    this.originalReceiveDate,
    this.treatedForAE,
    this.reaction,
    this.receiver,
    this.primaryReporter,
    this.numberOfAnimalsAffected,
    this.numberOfAnimalsTreated,
    this.drug,
    this.duration,
    this.healthAssessment,
    this.onsetDate,
    this.reportId,
    this.animal,
    this.typeOfInformation,
    this.seriousAE,
    this.outcome,
  });

  factory AnimalPetResult.fromJson(Map<String, dynamic> json) {
    return AnimalPetResult(
      uniqueAERIdNumber: json['unique_aer_id_number'],
      originalReceiveDate: json['original_receive_date'],
      treatedForAE: json['treated_for_ae'],
      reaction: (json['reaction'] as List?)
          ?.map((e) => Reaction.fromJson(e))
          .toList(),
      receiver: json['receiver'] != null
          ? Receiver.fromJson(json['receiver'])
          : null,
      primaryReporter: json['primary_reporter'],
      numberOfAnimalsAffected: int.tryParse(
        json['number_of_animals_affected'] ?? '',
      ),
      numberOfAnimalsTreated: int.tryParse(
        json['number_of_animals_treated'] ?? '',
      ),
      drug: (json['drug'] as List?)?.map((e) => Drug.fromJson(e)).toList(),
      duration: json['duration'] != null
          ? DurationInfo.fromJson(json['duration'])
          : null,
      healthAssessment: json['health_assessment_prior_to_exposure'] != null
          ? HealthAssessment.fromJson(
              json['health_assessment_prior_to_exposure'],
            )
          : null,
      onsetDate: json['onset_date'],
      reportId: json['report_id'],
      animal: json['animal'] != null ? Animal.fromJson(json['animal']) : null,
      typeOfInformation: json['type_of_information'],
      seriousAE: json['serious_ae'],
      outcome: (json['outcome'] as List?)
          ?.map((e) => Outcome.fromJson(e))
          .toList(),
    );
  }
}

class Reaction {
  final String veddraTermName;

  Reaction({required this.veddraTermName});

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(veddraTermName: json['veddra_term_name']);
  }
}

class Receiver {
  final String organization;
  final String? city;
  final String? state;

  Receiver({required this.organization, this.city, this.state});

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      organization: json['organization'],
      city: json['city'],
      state: json['state'],
    );
  }
}

class Drug {
  final String brandName;
  final String? dosageForm;

  Drug({required this.brandName, this.dosageForm});

  factory Drug.fromJson(Map<String, dynamic> json) {
    return Drug(
      brandName: json['brand_name'] ?? '',
      dosageForm: json['dosage_form'],
    );
  }
}

class DurationInfo {
  final String value;
  final String? unit;

  DurationInfo({required this.value, this.unit});

  factory DurationInfo.fromJson(Map<String, dynamic> json) {
    return DurationInfo(value: json['value'], unit: json['unit']);
  }
}

class HealthAssessment {
  final String? condition;
  final String? assessedBy;

  HealthAssessment({this.condition, this.assessedBy});

  factory HealthAssessment.fromJson(Map<String, dynamic> json) {
    return HealthAssessment(
      condition: json['condition'],
      assessedBy: json['assessed_by'],
    );
  }
}

class Animal {
  final String? species;
  final String? gender;
  final AnimalAge? age;
  final AnimalWeight? weight;
  final Breed? breed;

  Animal({this.species, this.gender, this.age, this.weight, this.breed});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      species: json['species'],
      gender: json['gender'],
      age: json['age'] != null ? AnimalAge.fromJson(json['age']) : null,
      weight: json['weight'] != null
          ? AnimalWeight.fromJson(json['weight'])
          : null,
      breed: json['breed'] != null
          ? Breed.fromJson(json['breed'] as Map<String, dynamic>)
          : null,
    );
  }
}

class AnimalAge {
  final String? min;
  final String? unit;

  AnimalAge({this.min, this.unit});

  factory AnimalAge.fromJson(Map<String, dynamic> json) {
    return AnimalAge(min: json['min'], unit: json['unit']);
  }
}

class AnimalWeight {
  final String? min;
  final String? unit;

  AnimalWeight({this.min, this.unit});

  factory AnimalWeight.fromJson(Map<String, dynamic> json) {
    return AnimalWeight(min: json['min'], unit: json['unit']);
  }
}

class Breed {
  final List<String>? breedComponent;

  Breed({this.breedComponent});

  factory Breed.fromJson(Map<String, dynamic> json) {
    final raw = json['breed_component'];
    List<String>? parsedList;

    if (raw is List) {
      parsedList = raw.map((e) => e.toString()).toList();
    } else if (raw is String) {
      parsedList = [raw];
    }

    return Breed(breedComponent: parsedList);
  }
}

class Outcome {
  final String? medicalStatus;

  Outcome({this.medicalStatus});

  factory Outcome.fromJson(Map<String, dynamic> json) {
    return Outcome(medicalStatus: json['medical_status']);
  }
}
