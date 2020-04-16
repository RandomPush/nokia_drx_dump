#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:50331648:cc0a02ed0d566057a9fb19cb693fb98ae00aac51; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:59c11722dd73aa62d43758aa4fd0c3fba57aace8 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:50331648:cc0a02ed0d566057a9fb19cb693fb98ae00aac51 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
