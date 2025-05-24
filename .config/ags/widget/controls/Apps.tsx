import Hyprland from "gi://AstalHyprland";

function getIconName(appName) {
    const lowerAppName = appName.toLowerCase();
    if (lowerAppName.includes("firefox")) {
        return "Firefox";
    }
    if (lowerAppName.includes("~")) {
        return "Terminal";
    }
    if (lowerAppName.includes("code")) {
        return "VS Code";
    }
    if (lowerAppName.includes("discord")) {
        return "Discord";
    }
    else {
        return appName;
    }
}

let currentOpenAppTitles = [];
let __openAppsListenersInitialized = false;

function updateOpenAppTitles() {
    const hyprland = Hyprland.get_default();
    const newTitles = [];

    for (const client of hyprland.get_clients()) {
        newTitles.push(getIconName(client.title));
    }

    currentOpenAppTitles = newTitles;
    if (typeof global !== 'undefined' && global.emit) {
        global.emit('open-apps-updated');
    }
}

export function OpenApps() {
    const hyprland = Hyprland.get_default();

    if (!__openAppsListenersInitialized) {
        hyprland.connect('client-added', updateOpenAppTitles);
        hyprland.connect('client-removed', updateOpenAppTitles);
        updateOpenAppTitles(); // Initial population
        __openAppsListenersInitialized = true;
    }

    return <box className="OpenApps">
        {currentOpenAppTitles.map(title => (
            <label key={title} label={title}></label>
        ))}
    </box>;
}