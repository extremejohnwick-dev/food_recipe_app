final List<Category> cateogrylist = [
  Category(
    image:
        'assets/svg/png/e2826adbdfed53a0ca21c618d81a0a15-removebg-preview.png',
    name: 'Fruits',
  ),
  Category(
    image:
        'assets/svg/png/ac2f3df923e0082bae363e9531a56559-removebg-preview.png',
    name: 'Bread',
  ),
  Category(
    image:
        'assets/svg/png/bbb7f3bb0fe59ee186ea8b5b579c84be-removebg-preview.png',
    name: 'Vegatables',
  ),
  Category(
    image:
        'assets/svg/png/b4d8ebf923128702e36c09e43c79682b-removebg-preview.png',
    name: 'Cereals',
  ),
  Category(
    image:
        'assets/svg/png/19db239f4d03a3e22a3b49e80080f3b9-removebg-preview.png',
    name: 'Oats',
  ),
];

class Category {
  final String image, name;
  Category({required this.image, required this.name});
}
