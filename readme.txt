#Perintah

## file nginx (/dockerfiles/nginx.dockerfile)
	ubah baris 5 sesuaikan nama folder project
	
## Change this :
    file nginx (/dockerfiles/nginx.dockerfile)

## Create project laravel
docker exec -w /var/www/html/ 1eca347a7e68 composer create-project laravel/laravel=9.1.5 crud-laravel9 

## Composer Install :
docker exec -w /var/www/html/{nama project} composer install && cp .env.example .env && php artisan key:generate && php artisan migrate --seed
menjalan

