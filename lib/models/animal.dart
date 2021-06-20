class Animal {
  int id;
  String name = '';
  int price = 0;

  Animal({ required this.id}) {
    if (id == 1) {
      name = 'coma';
      price = 100;
    }
  }

}