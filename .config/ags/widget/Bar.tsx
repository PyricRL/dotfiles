import { Astal, Gtk, Gdk} from "astal/gtk3"
import { AudioControl } from "./controls/AudioControl";
import { Media } from "./controls/Media";
import { OpenApps } from "./controls/Apps";
import AudioMenu from "./menus/AudioMenu";

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

    return <window
        exclusivity={Astal.Exclusivity.EXCLUSIVE} // sets it to be above and push other windows down
        className="Bar"
        gdkmonitor={gdkmonitor} // allows for both windows with arguments
        anchor={TOP | LEFT | RIGHT} // anchor to hit top, left, and right
    >
        <centerbox>
            <box halign={Gtk.Align.BASELINE}>
                <OpenApps />
            </box>
            <Media />
            <box halign={Gtk.Align.END}>
                <button onClicked={() => AudioMenu.visible = !AudioMenu.visible}>
                    Menu
                </button>
            </box>
        </centerbox>
    </window>
}