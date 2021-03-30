#!/bin/bash

# Enable swap
if ! (grep /swapfile /etc/fstab >/dev/null); then
    fallocate -l 8G /swapfile;
    chmod 600 /swapfile;
    mkswap /swapfile;
    swapon /swapfile;
    echo "/swapfile swap swap defaults 0 0" >>/etc/fstab;
fi

# Stage files
stage=`mktemp -d`;
cp -r home/* "$stage";

# Set ownership
chown -R ubuntu:ubuntu "$stage"/*;
chown root:root "$stage/admin/updatereboot.sh";

# Set directory permissionstop
find -P "$stage" -type d |
while read dir; do
    chmod 775 "$dir"
done

# Set file permissions
chmod +x *.sh;
find -P "$stage" -type f |
while read file; do
    case "$file" in
        # Allow execution of scripts
        *.sh) chmod 774 "$file";;
        # Otherwise basic read/write permissions
        *) chmod 664 "$file";;
    esac
done

# Install files
mv "$stage"/* "/home/ubuntu/";
rmdir "$stage";

# Install steamcmd
add-apt-repository multiverse;
dpkg --add-architecture i386;
apt update;
echo 'steamcmd steam/question select I AGREE' | debconf-set-selections;
echo 'steamcmd steam/license select true' | debconf-set-selections;
yes | apt install lib32gcc1 steamcmd;

# Install games
sudo -u ubuntu /usr/games/steamcmd +runscript /home/ubuntu/admin/updategames.steamcmd;
sudo -u ubuntu ./setupTerraria.sh;
sudo -u ubuntu ./setupTModLoader.sh;
sudo -u ubuntu ./setupValheim.sh;

# Install startup script
cp games.service /etc/systemd/system/;
systemctl enable games;

# Start games
systemctl start games;
