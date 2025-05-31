import { bind, Variable } from "astal";
import { Gtk } from "astal/gtk4";
import Wp from "gi://AstalWp";

const wireplumber = Wp.get_default();
const audio = wireplumber?.audio;

// Observe audio streams
const streams = Variable(audio?.get_streams() || [])
    .observe(audio, "stream-added", () => audio?.get_streams() || [])
    .observe(audio, "stream-removed", () => audio?.get_streams() || []);

// Function to format volume as percentage
function formatVolume(volume) {
    if (typeof volume === 'number') {
        return `${Math.round(volume * 100)}%`;
    }
    return "N/A";
}

export function MediaPopover() {
    return (
        <popover>
            <box vertical>
                {bind(streams).as(t => {
                    return t.map(stream => {
                        if (stream.description === "Chromium") {
                            return (
                                <box>
                                    <label label="Vesktop : " />
                                    <label label={`${stream.description} : `} />
                                    <label label={formatVolume(stream.volume)} />
                                </box>
                            );
                        } else {
                            return (
                                <box>
                                    <label label={`${stream.name} : `} />
                                    <label label={`${stream.description} : `} />
                                    <label label={formatVolume(stream.volume)} />
                                </box>
                            );
                        }
                    });
                })}
            </box>
        </popover>
    );
}

export function Media() {
    return <menubutton
        popover={(<MediaPopover/>)as Gtk.Popover}
    >
        <box>
            {bind(streams).as(t => {
                if (t && t.length > 0) {
                    const firstStream = t[0];
                    if (firstStream.icon === "applications-games") {
                        return (
                            <box>
                                <label cssClasses={["otherIcon"]} label={"\udb80\ude96"} />
                                <label label={firstStream.description} />
                            </box>
                        );
                    } else if (firstStream.icon == "application-x-executable-symbolic") {
                        return (
                            <box>
                                <label cssClasses={["otherIcon"]} label={"\udb80\ude39"} />
                                <label label={firstStream.name} />
                            </box>
                        );
                    } else if (firstStream.icon === "chromium-browser") {
                        return (
                            <box>
                                <label cssClasses={["otherIcon"]} label={"\uf1ff"} />
                                <label label={"Vesktop"} />
                            </box>
                        );
                    } else {
                        return (
                            <box cssClasses={[""]}>
                                <label cssClasses={["googleIcon"]} label={"tab"} />
                                <label label={firstStream.name} />
                            </box>
                        );
                    }
                } else {
                    return <label label="No streams" />;
                }
            })}
        </box>
    </menubutton>
}