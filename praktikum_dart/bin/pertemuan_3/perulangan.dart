import 'dart:io';

void main() {
  int? data, a, b;
  int awal = 1;

  // print("tentukan banyaknya perulangan :");
  // data = int.parse(stdin.readLineSync()!);

  // // while (awal <= data) {
  // //   print("$awal");
  // //   awal++;
  // // }

  // do {
  //   print("$awal");
  //   awal++;
  // } while (awal <= data);

  // int i = 1;

  print("masukka awal perualangan:");
  a = int.parse(stdin.readLineSync()!);

  print("masukkan akhir perulangan:");
  b = int.parse(stdin.readLineSync()!);

  for (int i = a; i <= b; i++) {
    print("$i");
  }
}
