import { Astal, Gtk, Gdk} from "astal/gtk3"
import { bind, subprocess } from "astal";
import Wp from "gi://AstalWp"

import { Media } from "./controls/Media";
import { OpenApps } from "./controls/Apps";
import { Workspaces } from "./controls/Workspaces";
import { Time } from "./controls/Time"

import AudioMenu from "./menus/AudioMenu";

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;
    const speaker = Wp.get_default()?.audio.defaultSpeaker!
    const mic = Wp.get_default()?.audio.defaultMicrophone!

    return <window
        exclusivity={Astal.Exclusivity.EXCLUSIVE} // sets it to be above and push other windows down
        className="Bar"
        gdkmonitor={gdkmonitor} // allows for both windows with arguments
        anchor={TOP | LEFT | RIGHT} // anchor to hit top, left, and right
    >
        <centerbox>
            <box halign={Gtk.Align.BASELINE} name="startCont">
                <Workspaces />
                <OpenApps />
            </box>
            <box name="centerCont">
                <Media />
            </box>
            <box halign={Gtk.Align.END} name="endCont">
                <box name="timeButtons">
                    <Time/>
                </box>
                <box name="audioButtons">
                    <button onClicked={() => subprocess("pactl set-sink-mute @DEFAULT_SINK@ toggle")} name="volumeButton">
                        <icon icon={bind(speaker, "volumeIcon")} />
                    </button>
                    <button onClicked={() => subprocess("pactl set-source-mute @DEFAULT_SOURCE@ toggle")} name="muteButton">
                        <icon icon={bind(mic, "volumeIcon")}/>
                    </button>
                    <button onClicked={() => AudioMenu.visible = !AudioMenu.visible} name="menuButton">
                        <label className="fa-icon"></label>
                    </button>
                </box>
            </box>
        </centerbox>
    </window>
}