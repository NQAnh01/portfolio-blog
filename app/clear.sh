#/bin/sh
composer dump-autoload \
&& php artisan cache:clear \
&& php artisan view:cache && php artisan config:clear && php artisan event:cache && php artisan route:cache