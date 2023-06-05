container := 83d3aa671362
project := api-laravel10 
#Menjalankan composer 
createproject:
	@docker exec -w /var/www/html/ $(container) $(command)

phpartisan:
	@docker exec -w /var/www/html/$(project)  $(container) php artisan $(command)
