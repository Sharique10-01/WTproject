sharique@raspberrypi:~/Downloads $ \chmod +x diagnose_mosquitto.sh 
sharique@raspberrypi:~/Downloads $ ./diagnose_mosquitto.sh 
==========================================
Mosquitto Diagnostic Tool
==========================================

[1] Checking Mosquitto installation...
/usr/sbin/mosquitto

[2] Checking service status...
× mosquitto.service - Mosquitto MQTT Broker
     Loaded: loaded (/usr/lib/systemd/system/mosquitto.service; enabled; preset: enabled)
     Active: failed (Result: exit-code) since Sun 2025-12-07 19:09:32 IST; 15min ago
   Duration: 2.562s
 Invocation: 41962f60a28f4773baafdd06282a6033
       Docs: man:mosquitto.conf(5)
             man:mosquitto(8)
    Process: 2720 ExecStartPre=/bin/mkdir -m 740 -p /var/log/mosquitto (code=exited, status=0/SUCCESS)
    Process: 2722 ExecStartPre=/bin/chown mosquitto:mosquitto /var/log/mosquitto (code=exited, status=0/SUCCESS)
    Process: 2724 ExecStartPre=/bin/mkdir -m 740 -p /run/mosquitto (code=exited, status=0/SUCCESS)
    Process: 2726 ExecStartPre=/bin/chown mosquitto:mosquitto /run/mosquitto (code=exited, status=0/SUCCESS)
    Process: 2728 ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf (code=exited, status=3)
   Main PID: 2728 (code=exited, status=3)

Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Scheduled restart job, restart counter is at 4.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Start request repeated too quickly.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Failed with result 'exit-code'.
Dec 07 19:09:32 raspberrypi systemd[1]: Failed to start mosquitto.service - Mosquitto MQTT Broker.

[3] Checking Mosquitto logs...
--- Last 30 lines from mosquitto.log ---
1765114768: mosquitto version 2.0.21 starting
1765114768: Config loaded from /etc/mosquitto/mosquitto.conf.
1765114768: Starting in local only mode. Connections will only be possible from clients running on this machine.
1765114768: Create a configuration file which defines a listener to allow remote access.
1765114768: For more details see https://mosquitto.org/documentation/authentication-methods/
1765114768: Opening ipv4 listen socket on port 1883.
1765114768: Opening ipv6 listen socket on port 1883.
1765114768: mosquitto version 2.0.21 running
1765114771: mosquitto version 2.0.21 terminating
1765114771: Saving in-memory database to /var/lib/mosquitto//mosquitto.db.

[4] Checking journalctl logs...
--- Last 20 lines from journal ---
Dec 07 19:09:31 raspberrypi mosquitto[2718]: 1765114771: Loading config file /etc/mosquitto/conf.d/local_config.conf
Dec 07 19:09:31 raspberrypi mosquitto[2718]: 1765114771: Error: Duplicate "log_dest file" value.
Dec 07 19:09:31 raspberrypi mosquitto[2718]: 1765114771: Error found at /etc/mosquitto/conf.d/local_config.conf:39.
Dec 07 19:09:31 raspberrypi mosquitto[2718]: 1765114771: Error found at /etc/mosquitto/mosquitto.conf:13.
Dec 07 19:09:31 raspberrypi systemd[1]: mosquitto.service: Main process exited, code=exited, status=3/NOTIMPLEMENTED
Dec 07 19:09:31 raspberrypi systemd[1]: mosquitto.service: Failed with result 'exit-code'.
Dec 07 19:09:31 raspberrypi systemd[1]: Failed to start mosquitto.service - Mosquitto MQTT Broker.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Scheduled restart job, restart counter is at 3.
Dec 07 19:09:32 raspberrypi systemd[1]: Starting mosquitto.service - Mosquitto MQTT Broker...
Dec 07 19:09:32 raspberrypi mosquitto[2728]: 1765114772: Loading config file /etc/mosquitto/conf.d/local_config.conf
Dec 07 19:09:32 raspberrypi mosquitto[2728]: 1765114772: Error: Duplicate "log_dest file" value.
Dec 07 19:09:32 raspberrypi mosquitto[2728]: 1765114772: Error found at /etc/mosquitto/conf.d/local_config.conf:39.
Dec 07 19:09:32 raspberrypi mosquitto[2728]: 1765114772: Error found at /etc/mosquitto/mosquitto.conf:13.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Main process exited, code=exited, status=3/NOTIMPLEMENTED
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Failed with result 'exit-code'.
Dec 07 19:09:32 raspberrypi systemd[1]: Failed to start mosquitto.service - Mosquitto MQTT Broker.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Scheduled restart job, restart counter is at 4.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Start request repeated too quickly.
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Failed with result 'exit-code'.
Dec 07 19:09:32 raspberrypi systemd[1]: Failed to start mosquitto.service - Mosquitto MQTT Broker.

[5] Testing configuration file syntax...
1765115683: Loading config file /etc/mosquitto/conf.d/local_config.conf
1765115683: Error: Duplicate "log_dest file" value.
1765115683: Error found at /etc/mosquitto/conf.d/local_config.conf:39.
1765115683: Error found at /etc/mosquitto/mosquitto.conf:13.

[6] Checking configuration files...
total 48
drwxr-xr-x   5 root root  4096 Dec  7 19:09 .
drwxr-xr-x 134 root root 12288 Dec  7 19:09 ..
-rw-r--r--   1 root root   230 Mar  6  2025 aclfile.example
drwxr-xr-x   2 root root  4096 Dec  7 19:09 ca_certificates
drwxr-xr-x   2 root root  4096 Dec  7 19:09 certs
drwxr-xr-x   2 root root  4096 Dec  7 19:09 conf.d
-rw-r--r--   1 root root   347 Mar 21  2025 mosquitto.conf
-rw-------   1 root root   125 Dec  7 19:09 passwd
-rw-r--r--   1 root root    23 Mar  6  2025 pskfile.example
-rw-r--r--   1 root root   355 Mar  6  2025 pwfile.example

total 16
drwxr-xr-x 2 root root 4096 Dec  7 19:09 .
drwxr-xr-x 5 root root 4096 Dec  7 19:09 ..
-rw-r--r-- 1 root root 3966 Dec  7 19:09 local_config.conf
-rw-r--r-- 1 root root  142 Mar 21  2025 README

[7] Checking password file...
-rw------- 1 root root 125 Dec  7 19:09 /etc/mosquitto/passwd

[8] Checking permissions...
total 12
drwxr-xr-x  2 mosquitto mosquitto 4096 Dec  7 19:09 .
drwxr-xr-x 10 root      root      4096 Dec  7 19:09 ..
-rw-------  1 mosquitto mosquitto  678 Dec  7 19:09 mosquitto.log
total 12
drwxr-xr-x  2 mosquitto root      4096 Dec  7 19:09 .
drwxr-xr-x 47 root      root      4096 Dec  7 19:09 ..
-rw-------  1 mosquitto mosquitto   47 Dec  7 19:09 mosquitto.db

==========================================
Diagnostic complete!
==========================================
