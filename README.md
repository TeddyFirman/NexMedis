<h1 align="center">NexMedis Sosmed</h1>



## Author

Dikembangkan oleh :

- Github : <a href="https://github.com/TeddyFirman"> Teddy Firman Winarto </a>

## Fitur 

- Autentikasi Admin dan User
- CRUD Postingan
- CRUD Komen
- Search Postingan dari keyword = judul postingan atau postingan
- Like & Dislike
- Dan lain-lain (Bisa di improve lagi)

## User

**User**

- email: user@gmail.com
- Password: password

## Install

**Clone Repository**

```bash
git clone https://github.com/TeddyFirman/First-Laravel-Project-84.git
```

**Download zip**

```bash
extract file zip
```

## Buka di kode editor


## Install composer

```bash
composer install
```

```bash
npm install
```

## Copy .Env

```bash
copy .env.example menjadi .env
```

## Buka Web Server


## Buat database di localhost 

```bash
nama database : <Sesuai keinginan kalian>
```

## Setting database di .env

```bash
DB_PORT=3306
DB_DATABASE=<Sesuai keinginan kalian>
DB_USERNAME=root
DB_PASSWORD=
```

## Generate key

```bash
php artisan key:generate
```

## Jalankan migrate dan seeder

```bash
php artisan migrate --seed
```

ATAU

Import database di folder database->nexmedis.sql

## Jalankan Serve

```bash
php artisan serve
```

```bash
npm run dev
```

## 1. Penjelasan Project
 - Project ini terinspirasi dari aplikasi X atau sosial media lainnya, dimana user di aplikasi ini bisa CRUD Postingan dan Komen tetapi di aplikasi ini juga terdapat admin untuk authorization atau "super admin" dimana admin bisa mengelola user dan postingan untuk kenyamanan aplikasi ini, tentu masih banyak yang bisa di improve lagi dari project ini

## 4. Dependency
 - Database MySQL
 - PHP
 - Composer
 - Postman / Aplikasi penguji API lainnya
 - Web Server (Laragon / XAMPP atau lainnya)
 - Text Editor

## License

- Copyright © 2024 TeddyFirman.
