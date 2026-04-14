void main() {
  String nama = "Rizky Fadhillah";
  String nim = "4112530001";

  for (int n = 0; n <= 201; n++) {
    int pembagi = 0;

    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        pembagi++;
      }
    }

    if (pembagi == 2) {
      print("Bilangan prima: $n");
      print("Nama: $nama");
      print("NIM : $nim");
    }
  }
}
