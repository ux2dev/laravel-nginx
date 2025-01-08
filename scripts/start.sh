#!/bin/bash
echo "Setting permissions for Laravel storage and cache directories..."
# Change ownership recursively for storage and cache
chown -R nginx:nginx /var/www/html
find /var/www/html -type d -exec chmod 775 {} \;
find /var/www/html -type f -exec chmod 664 {} \;
echo "Permissions have been successfully updated."

# Execute the main process (php-fpm or other CMD
/usr/bin/supervisord -n -c /etc/supervisord.conf