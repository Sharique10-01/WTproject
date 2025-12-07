#!/bin/bash
#
# Complete Mosquitto Reset and Configuration
# This will completely reset and reconfigure Mosquitto
#

echo "=========================================="
echo "Complete Mosquitto Reset"
echo "=========================================="
echo ""

echo "[1] Stopping Mosquitto service..."
sudo systemctl stop mosquitto
sudo systemctl disable mosquitto
echo ""

echo "[2] Removing ALL custom configurations..."
sudo rm -f /etc/mosquitto/conf.d/local_config.conf
sudo rm -f /etc/mosquitto/conf.d/local_config.conf.backup
echo ""

echo "[3] Checking what's in the default mosquitto.conf..."
echo "--- Contents of /etc/mosquitto/mosquitto.conf ---"
cat /etc/mosquitto/mosquitto.conf
echo "--- End of mosquitto.conf ---"
echo ""

echo "[4] Creating NEW simple configuration file..."
sudo tee /etc/mosquitto/mosquitto.conf > /dev/null <<'EOF'
# Mosquitto configuration for Energy Meter
# Complete standalone configuration

# Allow remote connections
listener 1883 0.0.0.0

# Require authentication
allow_anonymous false
password_file /etc/mosquitto/passwd

# Persistence settings
persistence true
persistence_location /var/lib/mosquitto/

# Logging
log_dest file /var/log/mosquitto/mosquitto.log
log_type error
log_type warning
log_type notice
log_type information

# Connection limits
max_connections 100
EOF

echo "✓ New configuration written to /etc/mosquitto/mosquitto.conf"
echo ""

echo "[5] Setting up directories..."
sudo mkdir -p /var/log/mosquitto
sudo mkdir -p /var/lib/mosquitto
sudo mkdir -p /run/mosquitto

sudo chown -R mosquitto:mosquitto /var/log/mosquitto
sudo chown -R mosquitto:mosquitto /var/lib/mosquitto
sudo chown -R mosquitto:mosquitto /run/mosquitto

sudo chmod 755 /var/log/mosquitto
sudo chmod 755 /var/lib/mosquitto
sudo chmod 755 /run/mosquitto
echo "✓ Directories configured"
echo ""

echo "[6] Creating password file..."
sudo rm -f /etc/mosquitto/passwd
sudo mosquitto_passwd -c -b /etc/mosquitto/passwd esp32_meter meter2025
sudo chown mosquitto:mosquitto /etc/mosquitto/passwd
sudo chmod 640 /etc/mosquitto/passwd
echo "✓ Password file created"
echo "  Username: esp32_meter"
echo "  Password: meter2025"
echo ""

echo "[7] Testing configuration syntax..."
sudo mosquitto -c /etc/mosquitto/mosquitto.conf -t
if [ $? -eq 0 ]; then
    echo "✓ Configuration syntax is VALID"
else
    echo "✗ Configuration has syntax errors!"
    exit 1
fi
echo ""

echo "[8] Enabling and starting Mosquitto..."
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
sleep 3
echo ""

echo "[9] Checking service status..."
sudo systemctl status mosquitto --no-pager -l
echo ""

echo "[10] Verifying Mosquitto is listening on port 1883..."
sudo netstat -tulpn | grep 1883 || sudo ss -tulpn | grep 1883
echo ""

if sudo systemctl is-active --quiet mosquitto; then
    echo "=========================================="
    echo "✓✓✓ SUCCESS! Mosquitto is RUNNING! ✓✓✓"
    echo "=========================================="
    echo ""
    echo "Connection Details:"
    echo "  IP: 192.168.1.105"
    echo "  Port: 1883"
    echo "  Username: esp32_meter"
    echo "  Password: meter2025"
    echo ""
    echo "Test with these commands:"
    echo ""
    echo "Terminal 1 (subscribe to all topics):"
    echo "  mosquitto_sub -h localhost -t '#' -u esp32_meter -P meter2025 -v"
    echo ""
    echo "Terminal 2 (publish a test message):"
    echo "  mosquitto_pub -h localhost -t 'test/hello' -m 'Hello MQTT!' -u esp32_meter -P meter2025"
    echo ""
else
    echo "=========================================="
    echo "✗ FAILED - Mosquitto is NOT running"
    echo "=========================================="
    echo ""
    echo "Checking logs for errors..."
    sudo journalctl -u mosquitto -n 30 --no-pager
    echo ""
    sudo tail -n 20 /var/log/mosquitto/mosquitto.log
fi
