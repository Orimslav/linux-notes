Sluzba na spustanie skriptu run_opc_reader.sh 
    umiestnenie  /etc/systemd/system/opc_reader.service

Spustanie opc_reader.service kazdych x sekund
    umiestnenie  /etc/systemd/system/opc_reader.timer

# 1. Načítaj nové konfigurácie systemd
sudo systemctl daemon-reload

# 2. Reštartuj timer (nie službu)
sudo systemctl restart opc_reader.timer

# 3. Over, že timer beží a podľa akého časovania
systemctl status opc_reader.timer
systemctl list-timers --all | grep opc_reader
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



