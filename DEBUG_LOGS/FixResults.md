sharique@raspberrypi:~/Downloads $ chmod +x fix_mosquitto.sh 
sharique@raspberrypi:~/Downloads $ ./fix_mosquitto.sh 
==========================================
Mosquitto Fix Script
==========================================

[1] Stopping Mosquitto...

[2] Backing up existing configuration...

[3] Creating minimal working configuration...
Configuration created at /etc/mosquitto/conf.d/local_config.conf

[4] Ensuring directories exist with correct permissions...

[5] Creating password file...
Username: esp32_meter
Password: meter2025

[6] Testing configuration...
1765115811: Loading config file /etc/mosquitto/conf.d/local_config.conf
1765115811: Error: Duplicate "log_dest file" value.
1765115811: Error found at /etc/mosquitto/conf.d/local_config.conf:11.
1765115811: Error found at /etc/mosquitto/mosquitto.conf:13.
✗ Configuration has errors!
