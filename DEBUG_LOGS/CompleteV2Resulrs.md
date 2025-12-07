==========================================
Complete Mosquitto Reset (Fixed)
==========================================

[1] Stopping Mosquitto service...

[2] Removing ALL custom configurations...

[3] Creating NEW simple configuration file...
✓ New configuration written to /etc/mosquitto/mosquitto.conf

[4] Setting up directories...
✓ Directories configured

[5] Creating password file...
✓ Password file created
  Username: esp32_meter
  Password: meter2025

[6] Enabling and starting Mosquitto...
Synchronizing state of mosquitto.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
Executing: /usr/lib/systemd/systemd-sysv-install enable mosquitto
Created symlink '/etc/systemd/system/multi-user.target.wants/mosquitto.service' → '/usr/lib/systemd/system/mosquitto.service'.

[7] Checking service status...
● mosquitto.service - Mosquitto MQTT Broker
     Loaded: loaded (/usr/lib/systemd/system/mosquitto.service; enabled; preset: enabled)
     Active: active (running) since Sun 2025-12-07 19:47:10 IST; 3s ago
 Invocation: 8636ca0ac8b947d3ae277d71e4c04869
       Docs: man:mosquitto.conf(5)
             man:mosquitto(8)
    Process: 4653 ExecStartPre=/bin/mkdir -m 740 -p /var/log/mosquitto (code=exited, status=0/SUCCESS)
    Process: 4655 ExecStartPre=/bin/chown mosquitto:mosquitto /var/log/mosquitto (code=exited, status=0/SUCCESS)
    Process: 4657 ExecStartPre=/bin/mkdir -m 740 -p /run/mosquitto (code=exited, status=0/SUCCESS)
    Process: 4659 ExecStartPre=/bin/chown mosquitto:mosquitto /run/mosquitto (code=exited, status=0/SUCCESS)
   Main PID: 4661 (mosquitto)
      Tasks: 1 (limit: 9570)
        CPU: 35ms
     CGroup: /system.slice/mosquitto.service
             └─4661 /usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf

Dec 07 19:47:10 raspberrypi systemd[1]: Starting mosquitto.service - Mosquitto MQTT Broker...
Dec 07 19:47:10 raspberrypi systemd[1]: Started mosquitto.service - Mosquitto MQTT Broker.

[8] Verifying Mosquitto is listening on port 1883...
Checking port 1883...
tcp        0      0 0.0.0.0:1883            0.0.0.0:*               LISTEN      4661/mosquitto      

==========================================
✓✓✓ SUCCESS! Mosquitto is RUNNING! ✓✓✓
==========================================

Connection Details:
  IP: 192.168.1.105
  Port: 1883
  Username: esp32_meter
  Password: meter2025

Test NOW with these commands:

Terminal 1 (subscribe to all topics):
  mosquitto_sub -h localhost -t '#' -u esp32_meter -P meter2025 -v

Terminal 2 (publish a test message):
  mosquitto_pub -h localhost -t 'test/hello' -m 'Hello MQTT!' -u esp32_meter -P meter2025

You should see 'test/hello Hello MQTT!' in Terminal 1
