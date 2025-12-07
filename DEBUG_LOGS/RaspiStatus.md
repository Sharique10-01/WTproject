sharique@raspberrypi:~/Downloads/RaspberryPi_Setup $ sudo systemctl status mosquitto
× mosquitto.service - Mosquitto MQTT Broker
     Loaded: loaded (/usr/lib/systemd/system/mosquitto.service; enabled; preset>
     Active: failed (Result: exit-code) since Sun 2025-12-07 19:09:32 IST; 2min>
   Duration: 2.562s
 Invocation: 41962f60a28f4773baafdd06282a6033
       Docs: man:mosquitto.conf(5)
             man:mosquitto(8)
    Process: 2720 ExecStartPre=/bin/mkdir -m 740 -p /var/log/mosquitto (code=ex>
    Process: 2722 ExecStartPre=/bin/chown mosquitto:mosquitto /var/log/mosquitt>
    Process: 2724 ExecStartPre=/bin/mkdir -m 740 -p /run/mosquitto (code=exited>
    Process: 2726 ExecStartPre=/bin/chown mosquitto:mosquitto /run/mosquitto (c>
    Process: 2728 ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.con>
   Main PID: 2728 (code=exited, status=3)

Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Scheduled restart jo>
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Start request repeat>
Dec 07 19:09:32 raspberrypi systemd[1]: mosquitto.service: Failed with result '>
Dec 07 19:09:32 raspberrypi systemd[1]: Failed to start mosquitto.service - Mos>
lines 1-18/18 (END)...skipping...
× mosquitto.service - Mosquitto MQTT Broker
     Loaded: loaded (/usr/lib/systemd/system/mosquitto.service; enabled; preset: enabled)
     Active: failed (Result: exit-code) since Sun 2025-12-07 19:09:32 IST; 2min 20s ago
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
