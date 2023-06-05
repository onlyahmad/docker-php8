yang harus diubah

- file nginx (/dockerfiles/nginx.dockerfile)
	ubah baris 5 sesuaikan nama folder project

create project
docker exec -w /var/www/html/ 1eca347a7e68 composer create-project laravel/laravel=9.1.5 crud-laravel9 

note: 1eca347a7e68 (container ID php8_php)
