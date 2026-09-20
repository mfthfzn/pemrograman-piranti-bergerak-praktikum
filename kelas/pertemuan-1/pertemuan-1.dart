// int add(int a, {int? b}) {
//   return a + b!;
// }

// void main() {
//   // int a = 2;
//   // int b = 3;
//   // int c = a + b;

//   // var c = add(4, b: 5);
//   // print(c);

//   // String? nama = "Bagus";

//   // print(nama ?? "Eko");

  
// }

// void main() {
//   // List<int> nilai = [1, 2, 3];
//   //   for (int i in nilai) {
//   //   print(i);
//   // }

//   // Set<int> nilai = {1, 2, 2, 3, 4, 4};
//   // for (int i in nilai) {
//   //   print(i);
//   // }

//   Map<String, String> products = {
//     "name" : "Laptop",
//     "price" : "20000"
//   };

//   // for(int i = 0; i < products.length; i++) {
//   //   print(products["name"]);
//   // }
//   products.forEach(((key, value) => {
//     print("$key, $value")
//   }));
// }

class Car {
  int? seats;
  String? brand;
  String? models;
  int? wheels;

  Car({
    this.seats,
    required this.brand,
    required this.models,
    required this.wheels
  });

  void vroom() {
    print("vroom vroom");
  }

  void tampilkan() {
    print(this.seats);
    print(this.brand);
    print(this.models);
    print(this.wheels);
  }
}

void main() {
  Car car = Car(brand: "Toyota", models: "Fortuner", wheels: 4);
  car.vroom();
  car.tampilkan();
}
