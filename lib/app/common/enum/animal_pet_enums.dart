import 'package:fd_admin/app/common/constants/image_paths.dart';

enum AnimalPetEnums {
  animalDogs("Dogs", ImagePaths.dog),
  animalCats("Cats", ImagePaths.cat),
  animalHorses("Horses", ImagePaths.horse),
  animalChickens("Chickens", ImagePaths.chicken),
  animalCattle("Cattle", ImagePaths.cattle),
  animalOthers("Others", ImagePaths.others);

  final String icon;
  final String title;

  const AnimalPetEnums(this.title, this.icon);
}
