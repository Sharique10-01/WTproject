#!/bin/bash
#
# Mosquitto Fix Script V2
# This removes the duplicate log_dest conflict
#

echo "=========================================="
echo "Mosquitto Fix Script V2"
echo "=========================================="
echo ""

echo "[1] Stopping Mosquitto..."
sudo systemctl stop mosquitto || true
echo ""

echo "[2] Checking main mosquitto.conf..."
cat /etc/mosquitto/mosquitto.conf
echo ""

echo "[3] Creating clean configuration WITHOUT duplicate directives..."
sudo tee /etc/mosquitto/conf.d/local_config.conf > /dev/null <<'EOF'
# Energy Meter MQTT Configuration
# Minimal config without duplicates

# Listen on all interfaces, port 1883
listener 1883

# Authentication
allow_anonymous false
password_file /etc/mosquitto/passwd

# Persistence
persistence true
persistence_location /var/lib/mosquitto/
EOF

echo "✓ Clean configuration created"
echo ""

echo "[4] Ensuring directories exist with correct permissions..."
sudo mkdir -p /var/log/mosquitto
sudo chown mosquitto:mosquitto /var/log/mosquitto
sudo chmod 755 /var/log/mosquitto

sudo mkdir -p /var/lib/mosquitto
sudo chown mosquitto:mosquitto /var/lib/mosquitto
sudo chmod 755 /var/lib/mosquitto

sudo mkdir -p /run/mosquitto
sudo chown mosquitto:mosquitto /run/mosquitto
sudo chmod 755 /run/mosquitto
echo "✓ Directories ready"
echo ""

echo "[5] Recreating password file..."
sudo rm -f /etc/mosquitto/passwd
sudo mosquitto_passwd -c -b /etc/mosquitto/passwd esp32_meter meter2025
sudo chown mosquitto:mosquitto /etc/mosquitto/passwd
sudo chmod 640 /etc/mosquitto/passwd
echo "✓ Username: esp32_meter"
echo "✓ Password: meter2025"
echo ""

echo "[6] Testing configuration..."
if sudo mosquitto -c /etc/mosquitto/mosquitto.conf -t; then
    echo "✓ Configuration is VALID!"
else
    echo "✗ Configuration still has errors"
    echo ""
    echo "Let's see what's in main config:"
    cat /etc/mosquitto/mosquitto.conf
    exit 1
fi
echo ""

echo "[7] Starting Mosquitto..."
sudo systemctl start mosquitto
sleep 2
echo ""

echo "[8] Checking status..."
if sudo systemctl is-active --quiet mosquitto; then
    echo "✓✓✓ Mosquitto is RUNNING! ✓✓✓"
    echo ""
    sudo systemctl status mosquitto --no-pager -l
else
    echo "✗ Mosquitto failed to start"
    echo ""
    echo "Last 20 log lines:"
    sudo journalctl -u mosquitto -n 20 --no-pager
    exit 1
fi
echo ""

echo "=========================================="
echo "SUCCESS! Mosquitto is running!"
echo "=========================================="
echo ""
echo "Connection Details:"
echo "  IP: 192.168.1.105"
echo "  Port: 1883"
echo "  Username: esp32_meter"
echo "  Password: meter2025"
echo ""
echo "Test it now:"
echo ""
echo "Terminal 1 (subscribe):"
echo "  mosquitto_sub -h localhost -t 'test/#' -u esp32_meter -P meter2025"
echo ""
echo "Terminal 2 (publish):"
echo "  mosquitto_pub -h localhost -t 'test/hello' -m 'Hello MQTT!' -u esp32_meter -P meter2025"
echo ""
