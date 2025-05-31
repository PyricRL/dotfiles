import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable, subprocess, bind } from "astal"

import { OpenApps } from "./controls/Apps"
import { Audio } from "./controls/Audio";
import { Time } from "./controls/Time";
import { Media } from "./controls/Media"
import { MediaTest } from "./controls/TestAudio";

const time = Variable("").poll(1000, "date")

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}>
        <centerbox cssClasses={["centerbox"]}>
            <box halign={Gtk.Align.BASELINE} cssClasses={["leftCont"]}>
                <button cssClasses={["controlButton"]}>
                    <image file={"/home/pyric/.config/ags/widget/utils/bmw-32-white.png"}/>
                </button>
                <OpenApps />
            </box>
            <box cssClasses={["centerCont"]}>
                <Media />
            </box>
            <box halign={Gtk.Align.END} cssClasses={["rightCont"]}>
                <Audio />
                <Time />
            </box>
        </centerbox>
    </window>
}
