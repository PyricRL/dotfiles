import { GLib } from "gi://GLib";
import Hyprland from "gi://AstalHyprland";
import Apps from "gi://AstalApps";
import { Variable } from "astal";

function getIcon(appName) {
    const apps = new Apps.Apps({
        nameMultiplier: 2,
        entryMultiplier: 0,
        executableMultiplier: 2,
    })

    let appsIcon = apps.fuzzy_query(appName);
    let icon = null;
    for (let app of appsIcon) {
        icon = app.get_icon_name();
        return icon;
    }

    return "terminal";
}

let currentOpenApps = [];

function updateOpenAppTitles() {
    const hyprland = Hyprland.get_default();
    const newApps = [];

    for (const client of hyprland.get_clients()) {
        newApps.push({
            icon: getIcon(client.class),
            id: client.pid,
            title: client.title
        });
    }

    try {
        currentOpenApps = newApps;
    } catch (e) {
        console.error("Error setting value:", e);
    }

    // console.log("Attempting to set value:", newApps);
    // console.log("Current Apps: ", currentOpenApps)
}

export function OpenApps() {
    const hyprland = Hyprland.get_default();

    hyprland.connect('client-added', updateOpenAppTitles);
    hyprland.connect('client-removed', updateOpenAppTitles);

    updateOpenAppTitles();

    // console.log(currentOpenApps)

    return <box className="OpenApps">
        {currentOpenApps.map(({id, icon}) => (
            <button 
                key={id} 
                onClickRelease={(self, event) => {
                    if (event.button === 2) {
                        console.log("Middleclick")
                        hyprland.dispatch("killwindow", `pid:${id}`)
                    }
                    if (event.button === 1) {
                        hyprland.dispatch("focuswindow", `pid:${id}`)
                    }
                }}
            >
                <icon icon={icon}/>
            </button>
        ))}
    </box>;
}