# hackerio

**Aplikasi Blog Hacker**

Aplikasi yang menyajikan artikel yang berhubungan dengan cybersecurity. 

![image](https://github.com/aghatahfs/hackerio/assets/125784567/67dd3033-aeb1-49e9-a551-728f6e2b892f)

![image](https://github.com/aghatahfs/hackerio/assets/125784567/7b24bdf5-e426-49e2-8917-42bb586fdfba)

![image](https://github.com/aghatahfs/hackerio/assets/125784567/67e3d77b-0101-4fe4-a07f-449e56bc03ec)

![image](https://github.com/aghatahfs/hackerio/assets/125784567/7223bde1-f8e8-4cf3-a2d3-2f9432e863c5)


# Penjelasan Aplikasi

## 1. Asynchronus Programming & Circular Progres
Penerapan fechting API secara Asynchronus dengan circular progress. Disini kami menggunakan dependencies Dio untu fetching API. Untuk provider API saya buat sendiri dan saya hosting. Kami juga menambahkan circular progress ketika API tidak dapat dimuat untuk menjaga tampilan agar tidak rusak sekaligus untuk mengetahui apakah ada masalah pada koneksi atau pada provider API.

Berikut gambar code untuk fetching API:

**Fetching API:**

![image](https://github.com/aghatahfs/hackerio/assets/125784567/99937474-eebd-493d-874f-b6916796cf49)


**Circular Progres**

![image](https://github.com/aghatahfs/hackerio/assets/125784567/80e81f38-21df-425e-91d4-0d198b7817d4)

## 2. Penerapan Tema Darkmode dan LightMode
Penerapan fungsi untuk mengganti tema dark mode atau light mode dengan switch dan value key. Fungsi ini kami terapkan pada halaman setting dengan memberikan switch button. Agar aplikasi tetap mempertahankan tema ketika di close dan di jalankan kembali, kami menggunakan dependencies shared_preferences. 

![image](https://github.com/aghatahfs/hackerio/assets/125784567/72e5bfe5-eef5-417d-968c-6f42d994df0b)



dan Berikut Tampilan tema

**Light Mode**

![image](https://github.com/aghatahfs/hackerio/assets/125784567/a08dc97d-3dae-4543-a86b-f095eaf87838)

**Darkmode**

![image](https://github.com/aghatahfs/hackerio/assets/125784567/bfe5348c-3b93-4e5d-aa8b-eec4a568d766)

## 3. Penerapan Fitur Bookmark
Dengan fitur bookmark kita bisa menyimpan data secara local dan disini kami menggunakan dependencies 'get_storage'. Dengan 'get_storage' artikel atau post dapat disimpan secara lokal sehingga dapat di akses ketika user dalam mode offline.

![image](https://github.com/aghatahfs/hackerio/assets/125784567/fd8128f3-5eca-4fcf-b582-15e60b78679b)

![image](https://github.com/aghatahfs/hackerio/assets/125784567/4536cdbe-7d28-4015-988a-8ef31ad2dbd6)

![image](https://github.com/aghatahfs/hackerio/assets/125784567/d7221072-eb71-469e-b37b-f0151be55720)



