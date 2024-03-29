#!/usr/bin/env bash

# Set -E on bluetooth
cat <<'EOF' | tee /usr/lib/systemd/system/bluetooth.service
[Unit]
Description=Bluetooth service
Documentation=man:bluetoothd(8)
ConditionPathIsDirectory=/sys/class/bluetooth

[Service]
Type=dbus
BusName=org.bluez
ExecStart=/usr/lib/bluetooth/bluetoothd -E
NotifyAccess=main
#WatchdogSec=10
#Restart=on-failure
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
LimitNPROC=1
ProtectHome=true
ProtectSystem=full

[Install]
WantedBy=bluetooth.target
Alias=dbus-org.bluez.service
EOF

# Enabled LDAC HiDef in Pulse
sed -i 's/load-module module-bluetooth-discover/load-module module-bluetooth-discover a2dp_config="ldac_eqmid=hq ldac_fmt=f32"/' /etc/pulse/default.pa

# Sometimes it needs to be reinstalled
sudo -su liveuser yay -Sy --noconfirm --noeditmenu --nodiffmenu libldac
