# Starting the installer with BIRCHARCH_CHROOT_INSTALL=1 will put it into chroot mode
chrootable_systemctl_enable() {
  if [ -n "${BIRCHARCH_CHROOT_INSTALL:-}" ]; then
    sudo systemctl enable $1
  else
    sudo systemctl enable --now $1
  fi
}
