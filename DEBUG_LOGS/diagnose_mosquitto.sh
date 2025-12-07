#!/bin/bash
#
# Mosquitto Diagnostic Script
# Run this to find out why Mosquitto is failing
#

echo "=========================================="
echo "Mosquitto Diagnostic Tool"
echo "=========================================="
echo ""

echo "[1] Checking Mosquitto installation..."
which mosquitto
echo ""

echo "[2] Checking service status..."
sudo systemctl status mosquitto --no-pager -l
echo ""

echo "[3] Checking Mosquitto logs..."
echo "--- Last 30 lines from mosquitto.log ---"
sudo tail -n 30 /var/log/mosquitto/mosquitto.log 2>/dev/null || echo "Log file not found"
echo ""

echo "[4] Checking journalctl logs..."
echo "--- Last 20 lines from journal ---"
sudo journalctl -u mosquitto -n 20 --no-pager
echo ""

echo "[5] Testing configuration file syntax..."
sudo mosquitto -c /etc/mosquitto/mosquitto.conf -v
echo ""

echo "[6] Checking configuration files..."
ls -la /etc/mosquitto/
echo ""
ls -la /etc/mosquitto/conf.d/ 2>/dev/null || echo "conf.d directory not found"
echo ""

echo "[7] Checking password file..."
ls -la /etc/mosquitto/passwd 2>/dev/null || echo "Password file not found"
echo ""

echo "[8] Checking permissions..."
ls -la /var/log/mosquitto/ 2>/dev/null || echo "Log directory not found"
ls -la /var/lib/mosquitto/ 2>/dev/null || echo "Lib directory not found"
echo ""

echo "=========================================="
echo "Diagnostic complete!"
echo "=========================================="
