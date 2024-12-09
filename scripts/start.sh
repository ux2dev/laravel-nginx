#!/bin/bash
echo "Setting permissions for Laravel storage and cache directories..."
# Change ownership recursively for storage and cache
chown -R nginx:nginx /var/www/html/storage
chown -R nginx:nginx /var/www/html/bootstrap/cache
find /var/www/html/storage -type d -exec chmod 775 {} \;
find /var/www/html/bootstrap/cache -type d -exec chmod 775 {} \;
# Ensure files are writable by the owner and group
find /var/www/html/storage -type f -exec chmod 664 {} \;
find /var/www/html/bootstrap/cache -type f -exec chmod 664 {} \;
echo "Permissions have been successfully updated."
# Execute the main process (php-fpm or other CMD
/usr/bin/supervisord -n -c /etc/supervisord.conf