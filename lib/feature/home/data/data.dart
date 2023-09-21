import 'package:job_tasks/contants/app_images.dart';

class Person {
  final String name;
  final String city;
  final String streetAddress;
  final String price;
  final String imageURL;
  final String message;

  Person({
    required this.name,
    required this.city,
    required this.price,
    required this.streetAddress,
    required this.imageURL,
    required this.message,
  });
}

List<Person> persons = <Person>[
  Person(
      name: 'Timothy Altenwerth',
      city: 'East Port Vincechester',
      price: '250\$ /',
      streetAddress: '565359 Fisher Stravenue',
      imageURL: AppImages.img1,
      message:
          'I heard babies needs more love nowadays. Please hug and kiss me more often.'),
  Person(
      name: 'Fernando Lynch',
      city: 'O\'Konview',
      price: '250\$ /',
      streetAddress: '682698 Bode Flats',
      imageURL: AppImages.img2,
      message:
          'I wan\'t to sleep more don\'t wake me up. I will stay awake all night I promise.'),
  Person(
      name: 'Astrid Wolff',
      city: 'Davetown',
      price: '250\$ /',
      streetAddress: '532429 Willow Ridge',
      imageURL: AppImages.img3,
      message:
          'What happened? Everyone is alright? I was under the blanket. It was so dark I can\'t believe.'),
  Person(
      name: 'Madison Beier',
      city: 'Ethanside',
      price: '250\$ /',
      streetAddress: '623190 Lewis Flats',
      imageURL: AppImages.img4,
      message: 'I can\'t believe how much I am happy to see you.'),
  Person(
      name: 'Josianne Gaylord',
      city: 'Mrazburgh',
      price: '250\$ /',
      streetAddress: '835334 Kuvalis Freeway',
      imageURL:AppImages.img5,
      message: 'Who wants to play with me? I am ready now.'),
  Person(
      name: 'hassan',
      city: 'Mrazburgh',
      price: '250\$ /',
      streetAddress: '835334 Kuvalis Freeway',
      imageURL:AppImages.img6,
      message: 'Who wants to play with me? I am ready now.'),
];
