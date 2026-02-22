#!/bin/bash

print_space() {
echo "=========================================="
}

print_space
echo "CPU Status:"
print_space
echo "CPU load average (1, 5, 15 minutes):"
uptime | awk -F'load average:' '{print $2}'
echo ""
echo "Detailed CPU stats:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: " $2 "% | System: " $4 "% | Idle: " $8 "%"}'

print_space
echo "RAM Status:"
print_space
free -h | awk 'NR==1{printf "%-15s %-10s %-10s %-10s\n", "Type", "Total", "Used", "Free"}'
free -h | awk 'NR==2{printf "%-15s %-10s %-10s %-10s\n", "Memory:", $2, $3, $4}'
free -h | awk 'NR==3{printf "%-15s %-10s %-10s %-10s\n", "Swap:", $2, $3, $4}'

print_space
echo "Disk Space Status:"
print_space
df -h | awk 'NR==1{printf "%-20s %-10s %-10s %-10s %-10s\n", "Filesystem", "Size", "Used", "Available", "Use%"}'
df -h | grep -E "^/dev/" | awk '{printf "%-20s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5}'

print_space
echo "Installing Nginx..."
print_space

apt-get update
apt-get install -y nginx

print_space
echo "Configuring Nginx to serve your HTML file..."
print_space

rm -f /etc/nginx/sites-enabled/default

cat > /etc/nginx/conf.d/my-site.conf << 'EOF'
server {
    listen 80;
    server_name localhost;
    
    root /var/www/html;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

print_space
echo "Copying HTML file..."
print_space

mkdir -p /var/www/html
cp index.html /var/www/html/
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "HTML file copied successfully!"

nginx -t

print_space
echo "Starting Nginx..."
print_space

service nginx start
sleep 2

print_space
echo "Checking Nginx Status..."
print_space

if service nginx status > /dev/null 2>&1; then
    echo "Nginx is RUNNING"
    
    echo ""
    echo "🌐 Port 80 check:"
    if ss -tlnp 2>/dev/null | grep -q ":80"; then
        echo "Port 80 is OPEN"
        ss -tlnp 2>/dev/null | head -3
    else
        echo "Port 80 is CLOSED"
    fi
    
else
    echo "Nginx is NOT running"
    echo "Error log:"
    cat /var/log/nginx/error.log
fi


print_space
echo "Final Result:"
print_space

IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "Your HTML page is being served at:"
echo "   • http://localhost:80"
echo "   • http://127.0.0.1:80"
if [ ! -z "$IP_ADDRESS" ]; then
    echo "   • http://$IP_ADDRESS:80"
fi

echo ""
echo "Page content:"
echo "--------------------------------"
curl -s http://localhost
echo "--------------------------------"

print_space
echo "All done! Container is running. Press Ctrl+C to exit."
print_space

tail -f /var/log/nginx/access.log