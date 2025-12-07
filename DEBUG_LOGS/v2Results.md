==========================================
Complete Mosquitto Reset
==========================================

[1] Stopping Mosquitto service...
Synchronizing state of mosquitto.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
Executing: /usr/lib/systemd/systemd-sysv-install disable mosquitto
Removed '/etc/systemd/system/multi-user.target.wants/mosquitto.service'.

[2] Removing ALL custom configurations...

[3] Checking what's in the default mosquitto.conf...
--- Contents of /etc/mosquitto/mosquitto.conf ---
# Place your local configuration in /etc/mosquitto/conf.d/
#
# A full description of the configuration file is at
# /usr/share/doc/mosquitto/examples/mosquitto.conf

#pid_file /run/mosquitto/mosquitto.pid

persistence true
persistence_location /var/lib/mosquitto/

log_dest file /var/log/mosquitto/mosquitto.log

include_dir /etc/mosquitto/conf.d
--- End of mosquitto.conf ---

[4] Creating NEW simple configuration file...
✓ New configuration written to /etc/mosquitto/mosquitto.conf

[5] Setting up directories...
✓ Directories configured

[6] Creating password file...
✓ Password file created
  Username: esp32_meter
  Password: meter2025

[7] Testing configuration syntax...
Error: Unknown option '-t'.
mosquitto version 2.0.21

mosquitto is an MQTT v5.0/v3.1.1/v3.1 broker.

Usage: mosquitto [-c config_file] [-d] [-h] [-p port]

 -c : specify the broker config file.
 -d : put the broker into the background after starting.
 -h : display this help.
 -p : start the broker listening on the specified port.
      Not recommended in conjunction with the -c option.
 -v : verbose mode - enable all logging types. This overrides
      any logging options given in the config file.

See https://mosquitto.org/ for more information.

✗ Configuration has syntax errors!
