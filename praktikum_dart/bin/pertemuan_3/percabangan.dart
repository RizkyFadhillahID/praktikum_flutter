import 'dart:io';

void main() {
  int n1, n2, hasil;

  print("masukkan bilangan pertama:");
  n1 = int.parse(stdin.readLineSync()!);

  print("masukkan bilangan kedua:");
  n2 = int.parse(stdin.readLineSync()!);

  hasil = n1 + n2;

  print("hasil penjumlahan $n1 + $n2 = $hasil");

  if (hasil % 2 == 0) {
    print("hasil penjumlahan adalah bilangan genap");
  } else {
    print("hasil penjumlahan adalah bilangan ganjil");
  }
}
