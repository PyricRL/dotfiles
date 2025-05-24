import { timeout } from "astal";
import Tray from "gi://AstalTray";

export function SystemTray() {
    const tray = Tray.get_default();

    timeout(10000, () => {
        print("System Tray Items:");
        for (const item of tray.get_items()) {
            print("  Title:", item.title);
            print("  Tooltip:", item.tooltip);
            print("  Icon Name:", item.icon_name);
        }
    });
}

SystemTray();