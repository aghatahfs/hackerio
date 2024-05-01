class postingan {
  String? id;
  String? judul;
  String? gambar;
  String? user;
  String? isi;
  String? kategori;
  String? createdAt;
  String? updateAt;

  postingan(
      {this.id,
      this.judul,
      this.gambar,
      this.user,
      this.isi,
      this.kategori,
      this.createdAt,
      this.updateAt});

  postingan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    gambar = json['gambar'];
    user = json['user'];
    isi = json['isi'];
    kategori = json['kategori'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['gambar'] = this.gambar;
    data['user'] = this.user;
    data['isi'] = this.isi;
    data['kategori'] = this.kategori;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}
