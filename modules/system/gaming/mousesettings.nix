{ config, pkgs, ... }:
{
  services.udev.extarRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="1216", ENV{ID_USB_INTERFACE_NUM}=="02", TAG+="uaccess"
  '';
}
