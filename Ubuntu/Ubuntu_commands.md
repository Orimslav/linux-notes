lsb_release -a       // zistenie verzie linuxu //

    vystup:
    scadauser@scada:~$ lsb_release -a
    No LSB modules are available.
    Distributor ID: Ubuntu
    Description:    Ubuntu 24.04.2 LTS
    Release:        24.04
    Codename:       noble
    scadauser@scada:~$


Vupnutie/ restart
    sudo poweroff
    sudo shutdown now
    sudo shutdown +1        //  vypnutie za 1 min
    sudo shutdown -c        // zrusenie naplanovaneho vypnutia
    
    sudo reboot
    sudo shutdown -r now
    sudo shutdown -r +5     // restart o 5 min



ip a        //zistenie ip adresy
ip link     //zistenie sietoveho rozhrania

docasna zmena ip adresy
    sudo ip addr flush dev eth0
    sudo ip addr add 192.168.1.100/24 dev eth0
    sudo ip route add default via 192.168.1.1

trvala zmena ip adresy
    otvorit configuracny subor a prepisat udaje

    sudo nano /etc/netplan/50-cloud-init.yaml

    network:
      version: 2
      ethernets:
        enp0s3:
          dhcp4: no
          addresses:
            - 192.168.1.100/24
          nameservers:
            addresses: [8.8.8.8, 8.8.4.4]
          routes:
            - to: 0.0.0.0/0
            via: 192.168.1.1

  
