    Setting up ethernet switch in bridge mode

    1st set up br0 interface
      # ip link set eth0 up
      # ip link set lan1 up
      # ip link set lan2 up
      # ip link add name br0 type bridge
      # ip link set dev lan1 master br0
      # ip link set dev lan2 master br0

    Bridge is now up. eth0, lan1, lan2 are on the same network.
    Fetch IP for br0 now:
      # udhcpc -i br0
      # ping google.com

    Measuring LAN speed:
      # iperf3 -c <IP address of PC running iperf3 server>


    Setting up WiFi with WPEA-121N PCIe WiFi module

    Scan for networks first:
      # ifconfig wlan0 up
      # iw dev wlan0 scan | grep ssid -i

    Connect to WiFi network with WPA:
      # wpa_passphrase <SSID> <password> > wpa_supplicant.conf
      # wpa_supplicant -B -Dnl80211 -i wlan0 -c wpa_supplicant.conf

    Check link status:
      # iw dev wlan0 link

    When link is up, acquire IP address:
      # udhcpc -i wlan0
      # ping google.com

