#!/bin/bash
#
# Mosquitto Fix Script
# This creates a minimal working configuration
#

set -e

echo "=========================================="
echo "Mosquitto Fix Script"
echo "=========================================="
echo ""

echo "[1] Stopping Mosquitto..."
sudo systemctl stop mosquitto || true
echo ""

echo "[2] Backing up existing configuration..."
sudo cp /etc/mosquitto/mosquitto.conf /etc/mosquitto/mosquitto.conf.backup 2>/dev/null || true
sudo cp /etc/mosquitto/conf.d/local_config.conf /etc/mosquitto/conf.d/local_config.conf.backup 2>/dev/null || true
echo ""

echo "[3] Creating minimal working configuration..."
sudo tee /etc/mosquitto/conf.d/local_config.conf > /dev/null <<'EOF'
# Minimal working configuration for Energy Meter

# Listen on all interfaces, port 1883
listener 1883

# Authentication
allow_anonymous false
password_file /etc/mosquitto/passwd

# Logging
log_dest file /var/log/mosquitto/mosquitto.log
log_dest stdout
log_type error
log_type warning
log_type notice
log_type information

# Persistence
persistence true
persistence_location /var/lib/mosquitto/
EOF

echo "Configuration created at /etc/mosquitto/conf.d/local_config.conf"
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
echo ""

echo "[5] Creating password file..."
# Remove old password file if exists
sudo rm -f /etc/mosquitto/passwd

# Create new password file
sudo mosquitto_passwd -c -b /etc/mosquitto/passwd esp32_meter meter2025
sudo chown mosquitto:mosquitto /etc/mosquitto/passwd
sudo chmod 640 /etc/mosquitto/passwd

echo "Username: esp32_meter"
echo "Password: meter2025"
echo ""

echo "[6] Testing configuration..."
if sudo mosquitto -c /etc/mosquitto/mosquitto.conf -t; then
    echo "✓ Configuration is valid!"
else
    echo "✗ Configuration has errors!"
    exit 1
fi
echo ""

echo "[7] Starting Mosquitto..."
sudo systemctl start mosquitto
sleep 2
echo ""

echo "[8] Checking status..."
if sudo systemctl is-active --quiet mosquitto; then
    echo "✓ Mosquitto is running!"
    echo ""
    sudo systemctl status mosquitto --no-pager -l
else
    echo "✗ Mosquitto failed to start!"
    echo ""
    echo "Checking logs:"
    sudo journalctl -u mosquitto -n 20 --no-pager
    exit 1
fi
echo ""

echo "=========================================="
echo "Fix Complete!"
echo "=========================================="
echo ""
echo "Mosquitto is now running on:"
echo "  IP: 192.168.1.105"
echo "  Port: 1883"
echo "  Username: esp32_meter"
echo "  Password: meter2025"
echo ""
echo "Test with:"
echo "  mosquitto_sub -h localhost -t 'test/#' -u esp32_meter -P meter2025"
echo ""
